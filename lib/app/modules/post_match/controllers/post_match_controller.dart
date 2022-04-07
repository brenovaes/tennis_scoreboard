// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';

class PostMatchController extends GetxController {
  final matchResult = Rx(MatchResult(
    Get.arguments.id,
    Get.arguments.teams,
    Get.arguments.sets,
    Get.arguments.winner,
    Get.arguments.matchTime,
    Get.arguments.stats,
  ));

  @override
  void onInit() {
    print(matchResult);
    super.onInit();
  }
}
