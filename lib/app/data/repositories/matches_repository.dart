import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';
import 'package:tennis_scoreboard/app/data/providers/hive_provider.dart';

class MatchesRepository {
  final HiveProvider provider;

  MatchesRepository(this.provider);

  Future<List<MatchResult>> loadAllMatches() async {
    return await provider.loadAllMatches();
  }

  Future<void> saveNewMatch(MatchResult newMatch) async {
    return await provider.saveNewMatch(newMatch);
  }

  Future<void> deleteAllMatches() async {
    return await provider.deleteAllMatches();
  }
}
