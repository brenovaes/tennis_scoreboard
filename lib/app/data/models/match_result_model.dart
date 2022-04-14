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
  String matchDuration;
  @HiveField(5)
  Map<String, dynamic> stats;
  @HiveField(6)
  DateTime date;
  @HiveField(7)
  List<int> result;

  MatchResult(
    this.id,
    this.teams,
    this.sets,
    this.winner,
    this.matchDuration,
    this.stats,
    this.date,
    this.result,
  );

  @override
  String toString() {
    return 'MatchResult(id: $id, teams: $teams, sets: $sets, winner: $winner, matchDuration: $matchDuration, stats: $stats, date: $date, result: $result)';
  }
}
