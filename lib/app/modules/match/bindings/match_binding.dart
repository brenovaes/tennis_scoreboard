import 'package:get/get.dart';

import '../controllers/match_controller.dart';

class MatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MatchController());
  }
}
