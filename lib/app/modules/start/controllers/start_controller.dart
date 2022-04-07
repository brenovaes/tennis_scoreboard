import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/match_settings_model.dart';

class StartController extends GetxController {
  final firstTeam = <String>[].obs;
  final secondTeam = <String>[].obs;

  final isLoadingMatch = false.obs;

  final _type = 1.obs;
  get type => _type.value;
  set type(value) => _type.value = value;
  onChangeType(value) {
    firstTeam.clear();
    secondTeam.clear();
    type = value;
  }

  final tiebreakPoints = 7.obs;
  onChangeTiebreakPoints(value) => tiebreakPoints.value = value;

  final setsQty = 3.obs;
  onChangeSetsQty(value) => setsQty.value = value;

  final gamesQty = 6.obs;
  onChangeGamesQty(value) => gamesQty.value = value;

  final advantages = 1.obs;
  onChangeAdvantages(value) => advantages.value = value;

  onSaveTeams(team, value) {
    if (team == 0) {
      type == 1 ? firstTeam.clear() : null;
      firstTeam.add(value);
    } else {
      type == 1 ? secondTeam.clear() : null;
      secondTeam.add(value);
    }
  }

  validatePlayers(value) =>
      value.length < 3 ? 'O nome deve conter pelo menos 3 caracteres' : null;

  MatchSettings generateMatchSettings() {
    var _matchSettings = MatchSettings(
      [firstTeam, secondTeam],
      setsQty.value,
      gamesQty.value,
      advantages.value == 1 ? true : false,
      tiebreakPoints.value,
    );

    return _matchSettings;
    /* await Get.toNamed(
      Routes.MATCH,
      arguments: _matchInfo,
    );
    return true; */
  }
}
