import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';
import 'package:tennis_scoreboard/app/data/providers/hive_provider.dart';

class MatchesRepository {
  final HiveProvider provider;

  MatchesRepository(this.provider);

  Future<List<MatchResult>> loadAllMatches() async {
    return await provider.loadAllMatches();
  }
}
