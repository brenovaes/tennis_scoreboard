// ignore_for_file: file_names

class MatchResult {
  List<List<String>> teams;
  List<Map<String, dynamic>> sets;
  String winner;
  String matchTime;
  Map<String, dynamic> stats;

  MatchResult(
    this.teams,
    this.sets,
    this.winner,
    this.matchTime,
    this.stats,
  );

  @override
  String toString() {
    return 'MatchResult(teams: $teams, sets: $sets, winner: $winner, matchTime: $matchTime, stats: $stats)';
  }
}
