import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResultsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(controller.matchesList.toString()),
        ),
      ),
    );
  }
}
