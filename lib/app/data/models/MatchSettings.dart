// ignore_for_file: file_names

class MatchSettings {
  List<List<String>> teams;
  int setsQty;
  int gamesQty;
  bool advantages;
  int tiebreak;

  MatchSettings(
    this.teams,
    this.setsQty,
    this.gamesQty,
    this.advantages,
    this.tiebreak,
  );

  @override
  String toString() {
    return 'MatchSettings(teams: $teams, setsQty: $setsQty, gamesQty: $gamesQty, advantages: $advantages, tiebreak: $tiebreak)';
  }
}
