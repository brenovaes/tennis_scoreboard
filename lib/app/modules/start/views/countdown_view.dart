import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/start/controllers/countdown_controller.dart';

class CountdownView extends GetView<CountdownController> {
  const CountdownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Color(0xFFFCEC63),
        ),
        child: Center(
          child: Obx(
            () => Text(
              controller.counter.value < 1
                  ? 'Play!'
                  : controller.counter.value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 60,
                decoration: TextDecoration.none,
                fontFamily: 'Gilroy',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
