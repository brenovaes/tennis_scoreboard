import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/start/controllers/countdown_controller.dart';

import '../controllers/start_controller.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(
      () => StartController(),
    );
    Get.lazyPut<CountdownController>(
      () => CountdownController(),
    );
  }
}
