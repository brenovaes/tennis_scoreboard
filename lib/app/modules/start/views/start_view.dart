import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/start/views/countdown_view.dart';
import 'package:tennis_scoreboard/app/ui/widgets/custom_elevated_button.dart';
import 'package:tennis_scoreboard/app/ui/widgets/custom_radio_button.dart';
import 'package:tennis_scoreboard/app/ui/widgets/custom_text_form_field.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Configurar partida',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  CustomRadioButton(
                                    label: "Simples",
                                    value: 1,
                                    onChanged: (value) =>
                                        controller.onChangeType(value),
                                    groupValue: controller.type,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomRadioButton(
                                    label: "Duplas",
                                    value: 2,
                                    onChanged: (value) =>
                                        controller.onChangeType(value),
                                    groupValue: controller.type,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => Container(
                            child: controller.type == 1
                                ? SinglesColumn()
                                : DoublesColumn(),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Sets:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: "1 set",
                                value: 1,
                                groupValue: controller.setsQty.value,
                                onChanged: (value) =>
                                    controller.onChangeSetsQty(value),
                              ),
                              CustomRadioButton(
                                label: "Melhor de 3",
                                value: 3,
                                groupValue: controller.setsQty.value,
                                onChanged: (value) =>
                                    controller.onChangeSetsQty(value),
                              ),
                              CustomRadioButton(
                                label: "Melhor de 5",
                                value: 5,
                                groupValue: controller.setsQty.value,
                                onChanged: (value) =>
                                    controller.onChangeSetsQty(value),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: Center(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        const Text(
                          "Games por set:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Visibility(
                                visible: controller.setsQty.value == 1,
                                child: CustomRadioButton(
                                  label: "4 games",
                                  value: 4,
                                  groupValue: controller.gamesQty.value,
                                  onChanged: (value) =>
                                      controller.onChangeGamesQty(value),
                                ),
                              ),
                              CustomRadioButton(
                                label: "6 games",
                                value: 6,
                                groupValue: controller.gamesQty.value,
                                onChanged: (value) =>
                                    controller.onChangeGamesQty(value),
                              ),
                              Visibility(
                                visible: controller.setsQty.value == 1,
                                child: CustomRadioButton(
                                  label: "8 games",
                                  value: 8,
                                  groupValue: controller.gamesQty.value,
                                  onChanged: (value) =>
                                      controller.onChangeGamesQty(value),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: Center(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        const Text(
                          "Vantagens:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: "Sim",
                                value: 1,
                                groupValue: controller.advantages.value,
                                onChanged: (value) =>
                                    controller.onChangeAdvantages(value),
                              ),
                              CustomRadioButton(
                                label: "Não",
                                value: 0,
                                groupValue: controller.advantages.value,
                                onChanged: (value) =>
                                    controller.onChangeAdvantages(value),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: Center(
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                        const Text(
                          "Tiebreak:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomRadioButton(
                                label: "7 pontos",
                                value: 7,
                                groupValue: controller.tiebreakPoints.value,
                                onChanged: (value) =>
                                    controller.onChangeTiebreakPoints(value),
                              ),
                              CustomRadioButton(
                                label: "Super (10 pontos)",
                                value: 10,
                                groupValue: controller.tiebreakPoints.value,
                                onChanged: (value) =>
                                    controller.onChangeTiebreakPoints(value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: Get.width - 50,
                    height: 50,
                    child: CustomElevatedButton(
                      label: "Vamos lá!",
                      onPressed: () async {
                        final FormState? form = formKey.currentState;
                        if (form!.validate()) {
                          form.save();
                          var _matchInfo = controller.generateMatchSettings();
                          Get.off(
                            () => const CountdownView(),
                            arguments: _matchInfo,
                          );
                          //var response = await controller.startMatch();
                          //response ? Get.back() : null;
                        }
                      },
                      backgroundColor: const Color(0xFFFCEC63),
                      labelWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SinglesColumn extends StatelessWidget {
  final StartController controller = Get.find<StartController>();

  SinglesColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Primeiro jogador",
          onSaved: (value) => controller.onSaveTeams(0, value),
          validator: (value) => controller.validatePlayers(value),
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Segundo jogador",
          onSaved: (value) => controller.onSaveTeams(1, value),
          validator: (value) => controller.validatePlayers(value),
        ),
      ],
    );
  }
}

class DoublesColumn extends StatelessWidget {
  final StartController controller = Get.find<StartController>();

  DoublesColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Primeira dupla",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Jogador 1",
          onSaved: (value) => controller.onSaveTeams(0, value),
          validator: (value) => controller.validatePlayers(value),
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Jogador 2",
          onSaved: (value) => controller.onSaveTeams(0, value),
          validator: (value) => controller.validatePlayers(value),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Segunda dupla",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Jogador 1",
          onSaved: (value) => controller.onSaveTeams(1, value),
          validator: (value) => controller.validatePlayers(value),
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          border: const OutlineInputBorder(),
          text: "Jogador 2",
          onSaved: (value) => controller.onSaveTeams(1, value),
          validator: (value) => controller.validatePlayers(value),
        ),
      ],
    );
  }
}
