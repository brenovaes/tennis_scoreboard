import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/modules/post_match_countdown/controllers/post_match_countdown_controller.dart';

class PostMatchCountdownBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostMatchCountdownController>(
      () => PostMatchCountdownController(),
    );
  }
}
