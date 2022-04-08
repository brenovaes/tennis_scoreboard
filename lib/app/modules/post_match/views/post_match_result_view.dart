// ignore_for_file: avoid_print
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tennis_scoreboard/app/modules/post_match/controllers/post_match_controller.dart';
import 'package:tennis_scoreboard/app/routes/app_pages.dart';
import 'package:tennis_scoreboard/app/ui/theme/palette.dart';
import 'package:tennis_scoreboard/app/ui/widgets/custom_elevated_button.dart';
import 'package:tennis_scoreboard/app/ui/widgets/players_display_widget.dart';

class PostMatchResultView extends GetView<PostMatchController> {
  const PostMatchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              color: Palette.ktodark,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: Get.width,
            constraints: BoxConstraints(
              minHeight: Get.height,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Parabéns,',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => SizedBox(
                          width: Get.width,
                          child: controller.matchResult.winner == 'first'
                              ? controller.matchResult.teams.first.length > 1
                                  ? Text(
                                      '${controller.matchResult.teams.first.first} e ${controller.matchResult.teams.first.last}!',
                                      style: const TextStyle(fontSize: 32),
                                    )
                                  : Text(
                                      '${controller.matchResult.teams.first.first}!',
                                      style: const TextStyle(fontSize: 32),
                                    )
                              : controller.matchResult.teams.last.length > 1
                                  ? Text(
                                      '${controller.matchResult.teams.last.first} e ${controller.matchResult.teams.last.last}!',
                                      style: const TextStyle(fontSize: 32),
                                    )
                                  : Text(
                                      '${controller.matchResult.teams.last.first}!',
                                      style: const TextStyle(fontSize: 32),
                                    ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text(
                        'Resumo da partida:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayersDisplayWidget(
                              players: controller.matchResult.teams.first,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:
                                    _buildScores(controller.matchResult.sets),
                              ),
                            ),
                            PlayersDisplayWidget(
                              players: controller.matchResult.teams.last,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          'PONTOS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StatsBarWidget(
                        firstTeamItem: controller
                            .matchResult.stats['firstTeamTotalPoints'],
                        secondTeamItem: controller
                            .matchResult.stats['secondTeamTotalPoints'],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          'ACES',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StatsBarWidget(
                        firstTeamItem:
                            controller.matchResult.stats['firstTeamAces'],
                        secondTeamItem:
                            controller.matchResult.stats['secondTeamAces'],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          'WINNERS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StatsBarWidget(
                        firstTeamItem:
                            controller.matchResult.stats['firstTeamWinners'],
                        secondTeamItem:
                            controller.matchResult.stats['secondTeamWinners'],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          'ERROS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StatsBarWidget(
                        firstTeamItem:
                            controller.matchResult.stats['firstTeamErrors'],
                        secondTeamItem:
                            controller.matchResult.stats['secondTeamErrors'],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          'DUPLAS FALTAS',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      StatsBarWidget(
                        firstTeamItem: controller
                            .matchResult.stats['firstTeamDoubleFaults'],
                        secondTeamItem: controller
                            .matchResult.stats['secondTeamDoubleFaults'],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: Get.width - 16,
                        child: Text(
                          'Duração da partida: ${controller.matchResult.matchTime.toString()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: Get.width - 50,
                    child: CustomElevatedButton(
                      onPressed: () => Get.offAllNamed(Routes.HOME),
                      label: 'Voltar para o início',
                      labelColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildScores(setsList) {
    return Column(
      children: List<Widget>.generate(
        setsList.length,
        (index) {
          return setsList[index]['tiebreak']
              ? Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      text: '',
                      children: [
                        TextSpan(
                          text: setsList[index]['firstTeamGames'].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: setsList[index]['firstTeamGames'] >
                                    setsList[index]['secondTeamGames']
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: setsList[index]['firstTeamTiebreakPoints']
                              .toString(),
                          style: const TextStyle(
                            fontFeatures: [
                              FontFeature.enable(
                                'sups',
                              ),
                            ],
                            color: Colors.black,
                          ),
                        ),
                        const TextSpan(
                          text: ':',
                        ),
                        TextSpan(
                          text: setsList[index]['secondTeamGames'].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: setsList[index]['secondTeamGames'] >
                                    setsList[index]['firstTeamGames']
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: setsList[index]['secondTeamTiebreakPoints']
                              .toString(),
                          style: const TextStyle(
                            fontFeatures: [
                              FontFeature.enable(
                                'sups',
                              ),
                            ],
                            color: Colors.black,
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
                      children: [
                        TextSpan(
                          text: setsList[index]['firstTeamGames'].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: setsList[index]['firstTeamGames'] >
                                    setsList[index]['secondTeamGames']
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const TextSpan(
                            text: ':',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        TextSpan(
                          text: setsList[index]['secondTeamGames'].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: setsList[index]['secondTeamGames'] >
                                    setsList[index]['firstTeamGames']
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class StatsBarWidget extends StatelessWidget {
  final int firstTeamItem;
  final int secondTeamItem;

  const StatsBarWidget({
    Key? key,
    required this.firstTeamItem,
    required this.secondTeamItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _greater = firstTeamItem > secondTeamItem
        ? 'first'
        : secondTeamItem > firstTeamItem
            ? 'second'
            : 'equal';
    final bool _allZero =
        firstTeamItem == 0 && secondTeamItem == 0 ? true : false;

    double _widthValue = _allZero
        ? Get.width - 16
        : Get.width *
                        (((firstTeamItem * 100) /
                                (secondTeamItem + firstTeamItem)) /
                            100) -
                    16 <
                0
            ? 0
            : Get.width *
                    (((firstTeamItem * 100) /
                            (secondTeamItem + firstTeamItem)) /
                        100) -
                16;

    Future<double> _width = Future<double>.value(_widthValue);

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 16,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: Palette.ktodark,
                    // color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      _allZero ? '' : secondTeamItem.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: _greater == 'second'
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                FutureBuilder<double>(
                  future: _width,
                  initialData: 0.0,
                  builder: (context, snapshot) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      alignment: Alignment.centerLeft,
                      height: 16,
                      width: snapshot.data,
                      decoration: BoxDecoration(
                        color: _allZero
                            ? const Color(0xFFFFF9C0)
                            : const Color(0xFFFCEC63),
                        // color: Colors.black,
                        borderRadius: secondTeamItem == 0
                            ? const BorderRadius.all(Radius.circular(50))
                            : const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          _allZero ? '' : firstTeamItem.toString(),
                          style: TextStyle(
                            fontWeight: _greater == 'first'
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
