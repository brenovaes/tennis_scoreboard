import 'package:get/get.dart';

import '../controllers/post_match_controller.dart';

class PostMatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostMatchController>(
      PostMatchController(),
    );
  }
}
