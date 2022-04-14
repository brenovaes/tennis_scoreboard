import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/routes/app_pages.dart';
import 'package:tennis_scoreboard/app/ui/widgets/custom_elevated_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: const Text(
                      'Tennis Scoreboard',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1.0,
                            ),
                          ]),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: Get.width - 50,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 50),
                        child: CustomElevatedButton(
                          label: 'Ver histórico de partidas',
                          onPressed: () => Get.toNamed(Routes.RESULTS),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Container(
                        width: Get.width - 50,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 50),
                        child: CustomElevatedButton(
                          label: 'Começar!',
                          onPressed: () {
                            Get.toNamed(Routes.START);
                          },
                          backgroundColor: const Color(0xFFFCEC63),
                          labelWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
