// ignore_for_file: file_names

import 'package:hive/hive.dart';
part 'match_result_model.g.dart';

@HiveType(typeId: 0)
class MatchResult extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  List<List<String>> teams;
  @HiveField(2)
  List<Map<String, dynamic>> sets;
  @HiveField(3)
  String winner;
  @HiveField(4)
  String matchTime;
  @HiveField(5)
  Map<String, dynamic> stats;

  MatchResult(
    this.id,
    this.teams,
    this.sets,
    this.winner,
    this.matchTime,
    this.stats,
  );

  @override
  String toString() {
    return 'MatchResult(id: $id, teams: $teams, sets: $sets, winner: $winner, matchTime: $matchTime, stats: $stats)';
  }
}
