// ignore_for_file: avoid_print
import 'dart:async';
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/MatchResult.dart';
import 'package:tennis_scoreboard/app/data/models/MatchSettings.dart';
import 'package:tennis_scoreboard/app/routes/app_pages.dart';

class MatchController extends GetxController {
  bool flag = true;
  Stream<int>? timerStream;
  StreamSubscription<int>? timerSubscription;
  final hoursStr = '00'.obs;
  final minutesStr = '00'.obs;
  final secondsStr = '00'.obs;
  StreamController<int>? streamController;
  Timer? timer;
  Duration timerInterval = const Duration(seconds: 1);
  int counter = 0;

  final isPaused = false.obs;
  late MatchSettings matchSettings;

  final firstTeamIsServing = true.obs;

  final firstTeamPoints = 0.obs;
  final secondTeamPoints = 0.obs;

  final firstTeamGames = 0.obs;
  final secondTeamGames = 0.obs;

  final firstTeamSets = 0.obs;
  final secondTeamSets = 0.obs;

  final firstTeamPointsAdvantage = false.obs;
  final secondTeamPointsAdvantage = false.obs;

  final currentSet = 1.obs;
  final isAtTieBreak = false.obs;

  final firstTeamAces = 0.obs;
  final secondTeamAces = 0.obs;

  final firstTeamDoubleFaults = 0.obs;
  final secondTeamDoubleFaults = 0.obs;

  final firstTeamWinners = 0.obs;
  final secondTeamWinners = 0.obs;

  final firstTeamErrors = 0.obs;
  final secondTeamErrors = 0.obs;

  final firstTeamTotalPoints = 0.obs;
  final secondTeamTotalPoints = 0.obs;

  final setsList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    matchSettings = MatchSettings(
      Get.arguments.teams,
      Get.arguments.setsQty,
      Get.arguments.gamesQty,
      Get.arguments.advantages,
      Get.arguments.tiebreak,
    );
    _startStopwatch();
    super.onInit();
  }

  _startStopwatch() {
    timerStream = stopWatchStream();
    timerSubscription = timerStream?.listen((int newTick) {
      hoursStr.value =
          ((newTick / (60 * 60)) % 60).floor().toString().padLeft(2, '0');
      minutesStr.value =
          ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
      secondsStr.value = (newTick % 60).floor().toString().padLeft(2, '0');
    });
  }

  Stream<int> stopWatchStream() {
    void pauseTimer() {
      timer!.cancel();
      isPaused.value = !(isPaused.value);
    }

    void stopTimer() {
      if (timer != null) {
        timer?.cancel();
        timer = null;
        counter = 0;
        streamController?.close();
        print('parei');
      }
    }

    void tick(_) {
      counter++;
      streamController?.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: pauseTimer,
    );

    return streamController!.stream;
  }

  void increasePoints(String team) {
    if (!isAtTieBreak.value) {
      var _actualPoints =
          team == 'first' ? firstTeamPoints.value : secondTeamPoints.value;

      int? _newPoints;

      switch (_actualPoints) {
        case 0:
          _newPoints = 15;
          break;
        case 15:
          _newPoints = 30;
          break;
        case 30:
          _newPoints = 40;
          break;
        case 40:
          _newPoints = 40;

          if (matchSettings.advantages) {
            if (firstTeamPoints.value == secondTeamPoints.value) {
              _checkPointsAdvantages(team);
              return;
            } else {
              _increaseGames(team);
              resetPoints();
              return;
            }
          } else {
            _increaseGames(team);
            resetPoints();
            return;
          }
      }

      team == 'first'
          ? firstTeamPoints.value = _newPoints as int
          : secondTeamPoints.value = _newPoints as int;
    } else {
      team == 'first' ? firstTeamPoints.value++ : secondTeamPoints.value++;
      if (((firstTeamPoints.value + secondTeamPoints.value) % 2) != 0) {
        firstTeamIsServing.value = !firstTeamIsServing.value;
      }
      if (firstTeamPoints.value == matchSettings.tiebreak &&
          secondTeamPoints.value <= matchSettings.tiebreak - 2) {
        _increaseGames(team);
        _addSetResultToList();
        resetPoints();
        _increaseSets(team);
        resetGames();
        isAtTieBreak.value = !isAtTieBreak.value;
      } else if (secondTeamPoints.value == matchSettings.tiebreak &&
          firstTeamPoints.value <= matchSettings.tiebreak - 2) {
        _increaseGames(team);
        _addSetResultToList();
        resetPoints();
        _increaseSets(team);
        resetGames();
        isAtTieBreak.value = !isAtTieBreak.value;
      } else if (firstTeamPoints.value > matchSettings.tiebreak &&
          firstTeamPoints.value - secondTeamPoints.value == 2) {
        _increaseGames(team);
        _addSetResultToList();
        resetPoints();
        _increaseSets(team);
        resetGames();
        isAtTieBreak.value = !isAtTieBreak.value;
      } else if (secondTeamPoints.value > matchSettings.tiebreak &&
          secondTeamPoints.value - firstTeamPoints.value == 2) {
        _increaseGames(team);
        _addSetResultToList();
        resetPoints();
        _increaseSets(team);
        resetGames();
        isAtTieBreak.value = !isAtTieBreak.value;
      }
    }
  }

  void _addSetResultToList() {
    setsList.add({
      "firstTeamGames": firstTeamGames.value,
      "secondTeamGames": secondTeamGames.value,
      "tiebreak": isAtTieBreak.value,
      "firstTeamTiebreakPoints":
          isAtTieBreak.value ? firstTeamPoints.value : null,
      "secondTeamTiebreakPoints":
          isAtTieBreak.value ? secondTeamPoints.value : null,
    });
  }

  void resetSets() {
    firstTeamSets.value = 0;
    secondTeamSets.value = 0;
    currentSet.value = 1;
  }

  void resetGames() {
    firstTeamGames.value = 0;
    secondTeamGames.value = 0;
  }

  void resetPoints() {
    firstTeamPoints.value = 0;
    secondTeamPoints.value = 0;
    firstTeamPointsAdvantage.value = false;
    secondTeamPointsAdvantage.value = false;
  }

  void _increaseSets(String team) {
    if (team == 'first') {
      firstTeamSets.value++;
      if (firstTeamSets.value > matchSettings.setsQty - firstTeamSets.value) {
        var _matchResult = MatchResult(
          matchSettings.teams,
          setsList,
          team,
          '$hoursStr:$minutesStr:$secondsStr',
          {
            'firstTeamAces': firstTeamAces.value,
            'secondTeamAces': secondTeamAces.value,
            'firstTeamWinners': firstTeamWinners.value,
            'secondTeamWinners': secondTeamWinners.value,
            'firstTeamErrors': firstTeamErrors.value,
            'secondTeamErrors': secondTeamErrors.value,
            'firstTeamDoubleFaults': firstTeamDoubleFaults.value,
            'secondTeamDoubleFaults': secondTeamDoubleFaults.value,
            'firstTeamTotalPoints': firstTeamTotalPoints.value,
            'secondTeamTotalPoints': secondTeamTotalPoints.value,
            'totalPoints':
                firstTeamTotalPoints.value + secondTeamTotalPoints.value,
          },
        );
        Get.offNamedUntil(
          Routes.POST_MATCH_COUNTDOWN,
          (route) => Get.currentRoute == '/home',
          arguments: _matchResult,
        );
        //Get.offAndToNamed(Routes.POST_MATCH_COUNTDOWN, arguments: _matchResult);
      } else {
        resetGames();
        currentSet.value++;
      }
    } else {
      secondTeamSets.value++;
      if (secondTeamSets.value > matchSettings.setsQty - secondTeamSets.value) {
        var _matchResult = MatchResult(
          matchSettings.teams,
          setsList,
          team,
          '$hoursStr:$minutesStr:$secondsStr',
          {
            'firstTeamAces': firstTeamAces.value,
            'secondTeamAces': secondTeamAces.value,
            'firstTeamWinners': firstTeamWinners.value,
            'secondTeamWinners': secondTeamWinners.value,
            'firstTeamErrors': firstTeamErrors.value,
            'secondTeamErrors': secondTeamErrors.value,
            'firstTeamDoubleFaults': firstTeamDoubleFaults.value,
            'secondTeamDoubleFaults': secondTeamDoubleFaults.value,
            'firstTeamTotalPoints': firstTeamTotalPoints.value,
            'secondTeamTotalPoints': secondTeamTotalPoints.value,
            'totalPoints':
                firstTeamTotalPoints.value + secondTeamTotalPoints.value,
          },
        );
        Get.offNamedUntil(
          Routes.POST_MATCH_COUNTDOWN,
          (route) => Get.currentRoute == '/home',
          arguments: _matchResult,
        );
        //Get.offAndToNamed(Routes.POST_MATCH_COUNTDOWN, arguments: _matchResult);
      }
    }
    //}
  }

  void _increaseGames(String team) {
    if (matchSettings.advantages == false) {
      firstTeamIsServing.value = !firstTeamIsServing.value;
      if (team == 'first') {
        firstTeamGames.value++;
        if (firstTeamGames.value == matchSettings.gamesQty) {
          _increaseSets(team);
        }
      } else {
        secondTeamGames.value++;
        if (secondTeamGames.value == matchSettings.gamesQty) {
          _increaseSets(team);
        }
      }
    } else {
      firstTeamIsServing.value = !firstTeamIsServing.value;
      team == 'first' ? firstTeamGames.value++ : secondTeamGames.value++;
      _checkGamesAdvantages(team);
    }
  }

  void _checkGamesAdvantages(String team) {
    if (firstTeamGames.value == matchSettings.gamesQty &&
        secondTeamGames.value == matchSettings.gamesQty) {
      isAtTieBreak.value = true;
      resetPoints();
    } else if (firstTeamGames.value == matchSettings.gamesQty + 1 &&
        secondTeamGames.value == matchSettings.gamesQty - 1) {
      _addSetResultToList();
      _increaseSets(team);
    } else if (secondTeamGames.value == matchSettings.gamesQty + 1 &&
        firstTeamGames.value == matchSettings.gamesQty - 1) {
      _addSetResultToList();
      _increaseSets(team);
    } else if (firstTeamGames.value == matchSettings.gamesQty &&
        secondTeamGames.value < matchSettings.gamesQty - 1) {
      _addSetResultToList();
      _increaseSets(team);
    } else if (secondTeamGames.value == matchSettings.gamesQty &&
        firstTeamGames.value < matchSettings.gamesQty - 1) {
      _addSetResultToList();
      _increaseSets(team);
    }
  }

  void _checkPointsAdvantages(String team) {
    if (!firstTeamPointsAdvantage.value && !secondTeamPointsAdvantage.value) {
      if (team == 'first') {
        firstTeamPointsAdvantage.value = true;
        secondTeamPointsAdvantage.value = false;
      } else {
        firstTeamPointsAdvantage.value = false;
        secondTeamPointsAdvantage.value = true;
      }
    } else {
      if (firstTeamPointsAdvantage.value && !secondTeamPointsAdvantage.value) {
        if (team == 'first') {
          _increaseGames(team);
          resetPoints();
        } else {
          firstTeamPointsAdvantage.value = false;
          secondTeamPointsAdvantage.value = false;
        }
      } else {
        if (team == 'first') {
          firstTeamPointsAdvantage.value = false;
          secondTeamPointsAdvantage.value = false;
        } else {
          _increaseGames(team);
          resetPoints();
        }
      }
    }
  }

  void decreasePoints(String team) {
    var _actualPoints =
        team == 'first' ? firstTeamPoints.value : secondTeamPoints.value;

    int? _newPoints;

    switch (_actualPoints) {
      case 0:
        _newPoints = 0;
        break;
      case 15:
        _newPoints = 0;
        break;
      case 30:
        _newPoints = 15;
        break;
      case 40:
        _newPoints = 30;
        break;
    }

    team == 'first'
        ? firstTeamPoints.value = _newPoints as int
        : secondTeamPoints.value = _newPoints as int;
  }

  @override
  void dispose() {
    timerSubscription!.cancel();
    super.dispose();
  }
}
