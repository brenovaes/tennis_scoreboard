// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';

class PostMatchController extends GetxController {
  final MatchResult matchResult = Get.arguments;

  @override
  void onInit() {
    print(matchResult);
    super.onInit();
  }
}
