import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';

class HiveProvider {
  final Box<MatchResult> _matchesBox = Get.find<Box<MatchResult>>();

  Future<List<MatchResult>> loadAllMatches() async {
    return _matchesBox.toMap().values.toList();
  }
}
