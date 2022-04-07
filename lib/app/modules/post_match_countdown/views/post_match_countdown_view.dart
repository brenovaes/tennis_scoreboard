import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/post_match_countdown/controllers/post_match_countdown_controller.dart';

class PostMatchCountdownView extends GetView<PostMatchCountdownController> {
  const PostMatchCountdownView({Key? key}) : super(key: key);

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
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: controller.counter.value <= 3,
                  child: const Text(
                    'game,',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.counter.value <= 2,
                  child: const Text(
                    'set,',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.counter.value <= 1,
                  child: const Text(
                    'match!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
