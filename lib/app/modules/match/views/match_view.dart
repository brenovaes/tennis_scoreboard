import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/match/views/widgets/score_buttons_widget.dart';

import 'package:tennis_scoreboard/app/routes/app_pages.dart';
import 'package:tennis_scoreboard/app/ui/widgets/players_display_widget.dart';

import '../controllers/match_controller.dart';

class MatchView extends GetView<MatchController> {
  const MatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var _response = await Get.dialog(
          AlertDialog(
            title: const Text('Cancelar partida'),
            content: const Text(
                'Deseja mesmo cancelar a partida? O placar será perdido e o progresso não será salvo.'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text('Voltar'),
              ),
              TextButton(
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: const Text('Confirmar'),
              ),
            ],
          ),
          barrierDismissible: false,
        );
        return _response;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => controller.isPaused.value
                ? const Text('Partida pausada')
                : const Text('Partida em andamento'),
          ),
          centerTitle: true,
          actions: [
            Obx(
              () => controller.isPaused.value == true
                  ? IconButton(
                      onPressed: () {
                        controller.isPaused.value =
                            !(controller.isPaused.value);
                        controller.timerSubscription!.resume();
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                    )
                  : IconButton(
                      onPressed: () => controller.timerSubscription!.pause(),
                      icon: const Icon(
                        Icons.pause,
                      ),
                    ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(
                    () => SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'TEMPO TOTAL',
                          ),
                          Text(
                            '${controller.hoursStr}:${controller.minutesStr}:${controller.secondsStr}',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlayersDisplayWidget(
                          players: controller.matchSettings.teams.first,
                        ),
                        Column(
                          children: [
                            const Text('GAMES'),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(() => Text(
                                      controller.firstTeamGames.value
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: controller
                                                    .firstTeamGames.value >
                                                controller.secondTeamGames.value
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    )),
                                const SizedBox(
                                  width: 20,
                                  child: Center(
                                    child: Text(
                                      ':',
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.secondTeamGames.value.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: controller
                                                  .secondTeamGames.value >
                                              controller.firstTeamGames.value
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => Text(
                                !controller.isAtTieBreak.value
                                    ? '${controller.currentSet.value.toString()}º SET'
                                    : 'TIEBREAK',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      child: Obx(
                                        () =>
                                            controller.firstTeamIsServing.value
                                                ? const Icon(
                                                    Icons.chevron_left_rounded,
                                                  )
                                                : const SizedBox.shrink(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Obx(
                                      () => Text(
                                        controller
                                                .firstTeamPointsAdvantage.value
                                            ? 'AD'
                                            : controller.firstTeamPoints
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: (controller
                                                          .firstTeamPoints
                                                          .value >
                                                      controller
                                                          .secondTeamPoints
                                                          .value) ||
                                                  (controller
                                                      .firstTeamPointsAdvantage
                                                      .value)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                  child: Center(
                                    child: Text(':'),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller
                                                .secondTeamPointsAdvantage.value
                                            ? 'AD'
                                            : controller.secondTeamPoints.value
                                                .toString(),
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: (controller
                                                          .secondTeamPoints
                                                          .value >
                                                      controller.firstTeamPoints
                                                          .value) ||
                                                  (controller
                                                      .secondTeamPointsAdvantage
                                                      .value)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: Obx(
                                        () => !(controller
                                                .firstTeamIsServing.value)
                                            ? const Icon(
                                                Icons.chevron_right_rounded,
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('SETS'),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.firstTeamSets.value.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: controller
                                                  .firstTeamSets.value >
                                              controller.secondTeamSets.value
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                  child: Center(
                                    child: Text(':'),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.secondTeamSets.value.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight:
                                          controller.secondTeamSets.value >
                                                  controller.firstTeamSets.value
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        PlayersDisplayWidget(
                          players: controller.matchSettings.teams.last,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => controller.setsList.isNotEmpty
                        ? Column(
                            children: [
                              const Divider(
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      child: Text(
                                        'Sets:',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 80,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: 20),
                                          itemCount: controller.setsList.length,
                                          scrollDirection: Axis.horizontal,
                                          /* physics:
                                              const NeverScrollableScrollPhysics(), */
                                          itemBuilder: (context, index) {
                                            return controller.setsList[index]
                                                    ['tiebreak']
                                                ? Center(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: DefaultTextStyle
                                                                .of(context)
                                                            .style
                                                            .copyWith(
                                                                fontSize: 18),
                                                        text: '',
                                                        children: [
                                                          TextSpan(
                                                            text: controller
                                                                .setsList[index]
                                                                    [
                                                                    'firstTeamGames']
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontWeight: controller
                                                                              .setsList[index]
                                                                          [
                                                                          'firstTeamGames'] >
                                                                      controller
                                                                              .setsList[index]
                                                                          [
                                                                          'secondTeamGames']
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: controller
                                                                .setsList[index]
                                                                    [
                                                                    'firstTeamTiebreakPoints']
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFeatures: [
                                                                FontFeature
                                                                    .enable(
                                                                  'sups',
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const TextSpan(
                                                            text: ':',
                                                          ),
                                                          TextSpan(
                                                            text: controller
                                                                .setsList[index]
                                                                    [
                                                                    'secondTeamGames']
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: controller
                                                                              .setsList[index]
                                                                          [
                                                                          'secondTeamGames'] >
                                                                      controller
                                                                              .setsList[index]
                                                                          [
                                                                          'firstTeamGames']
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: controller
                                                                .setsList[index]
                                                                    [
                                                                    'secondTeamTiebreakPoints']
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFeatures: [
                                                                FontFeature
                                                                    .enable(
                                                                  'sups',
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Center(
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text: '',
                                                          style: DefaultTextStyle
                                                                  .of(context)
                                                              .style,
                                                          children: [
                                                            TextSpan(
                                                              text: controller
                                                                  .setsList[
                                                                      index][
                                                                      'firstTeamGames']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight: controller.setsList[index]
                                                                            [
                                                                            'firstTeamGames'] >
                                                                        controller.setsList[index]
                                                                            [
                                                                            'secondTeamGames']
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                            const TextSpan(
                                                                text: ':'),
                                                            TextSpan(
                                                              text: controller
                                                                  .setsList[
                                                                      index][
                                                                      'secondTeamGames']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight: controller.setsList[index]
                                                                            [
                                                                            'secondTeamGames'] >
                                                                        controller.setsList[index]
                                                                            [
                                                                            'firstTeamGames']
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      ScoreButtonsWidget(team: 'first'),
                      ScoreButtonsWidget(team: 'second'),
                    ],
                  ),
                  /* Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Points 1: ${controller.firstTeamTotalPoints.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Aces 1: ${controller.firstTeamAces.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Winners 1: ${controller.firstTeamWinners.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Errors 1: ${controller.firstTeamErrors.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Double faults 1: ${controller.firstTeamDoubleFaults.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Points 2: ${controller.secondTeamTotalPoints.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Aces 2: ${controller.secondTeamAces.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Winners 2: ${controller.secondTeamWinners.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Errors 2: ${controller.secondTeamErrors.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Double faults 2: ${controller.secondTeamDoubleFaults.value.toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), */
                  /* ElevatedButton(
                    onPressed: () => controller.resetPoints(),
                    child: const Text('Zerar pontos'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isAtTieBreak.value = false;
                      controller.resetGames();
                    },
                    child: const Text('Zerar games'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.resetSets(),
                    child: const Text('Zerar sets'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.setsList.clear(),
                    child: const Text('Zerar setsList'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(controller.matchSettings.toString());
                      //print(Get.arguments.teams);
                    },
                    child: const Text('Print info'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(controller.setsList.toString());
                      //print(Get.arguments.teams);
                    },
                    child: const Text('Print sets'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(Get.currentRoute);
                      //print(Get.arguments.teams);
                    },
                    child: const Text('Print route'),
                  ), */
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.isPaused.value,
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white.withOpacity(0.8),
                  child: const Center(
                    child: Text(
                      'Pause',
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
