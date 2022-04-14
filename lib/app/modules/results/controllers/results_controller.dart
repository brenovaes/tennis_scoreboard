import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';
import 'package:tennis_scoreboard/app/data/providers/hive_provider.dart';
import 'package:tennis_scoreboard/app/data/repositories/matches_repository.dart';

class ResultsController extends GetxController {
  final MatchesRepository _matchesRepository =
      MatchesRepository(HiveProvider());

  final isExpanded = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    _loadAllMatches();
  }

  Future<void> _loadAllMatches() async {
    var result = await _matchesRepository.loadAllMatches();
    matchesList.clear();
    matchesList.addAll(result);
    //_matchesRepository.deleteAllMatches();
  }

  final matchesList = <MatchResult>[].obs;
}
