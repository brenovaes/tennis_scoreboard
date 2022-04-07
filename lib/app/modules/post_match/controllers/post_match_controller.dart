// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/MatchResult.dart';

class PostMatchController extends GetxController {
  final matchResult = Rx(MatchResult(
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
