// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/routes/app_pages.dart';

class PostMatchCountdownController extends GetxController {
  final counter = 3.obs;
  Timer? timer;

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        counter.value--;
        counter.value == 0 ? _stopTimer() : null;
      },
    );
  }

  _stopTimer() {
    timer!.cancel();
    Get.toNamed(
      Routes.POST_MATCH,
      arguments: Get.arguments,
    );
  }
}
