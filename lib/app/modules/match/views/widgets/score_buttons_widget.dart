import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/match/controllers/match_controller.dart';

class ScoreButtonsWidget extends StatelessWidget {
  final MatchController controller = Get.find<MatchController>();
  final String team;

  ScoreButtonsWidget({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (team == 'first') {
                      controller.firstTeamWinners.value++;
                      controller.firstTeamTotalPoints.value++;
                    } else {
                      controller.secondTeamWinners.value++;
                      controller.secondTeamTotalPoints.value++;
                    }
                    controller.increasePoints(team);
                  },
                  child: const Text(
                    'Winner',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (team == 'first') {
                      controller.firstTeamAces.value++;
                      controller.firstTeamTotalPoints.value++;
                    } else {
                      controller.secondTeamAces.value++;
                      controller.secondTeamTotalPoints.value++;
                    }
                    controller.increasePoints(team);
                  },
                  child: const Text(
                    'Ace',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (team == 'first') {
                      controller.secondTeamErrors.value++;
                      controller.firstTeamTotalPoints.value++;
                    } else {
                      controller.firstTeamErrors.value++;
                      controller.secondTeamTotalPoints.value++;
                    }
                    controller.increasePoints(team);
                  },
                  child: const Text(
                    'Erro do adversário',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (team == 'first') {
                      controller.secondTeamDoubleFaults.value++;
                      controller.firstTeamTotalPoints.value++;
                    } else {
                      controller.firstTeamDoubleFaults.value++;
                      controller.secondTeamTotalPoints.value++;
                    }
                    controller.increasePoints(team);
                  },
                  child: const Text(
                    'Dupla falta do adversário',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
