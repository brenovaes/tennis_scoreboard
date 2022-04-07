import 'package:get/get.dart';

import 'package:tennis_scoreboard/app/modules/home/bindings/home_binding.dart';
import 'package:tennis_scoreboard/app/modules/home/views/home_view.dart';
import 'package:tennis_scoreboard/app/modules/match/bindings/match_binding.dart';
import 'package:tennis_scoreboard/app/modules/match/views/match_view.dart';
import 'package:tennis_scoreboard/app/modules/post_match/bindings/post_match_binding.dart';
import 'package:tennis_scoreboard/app/modules/post_match/views/post_match_result_view.dart';
import 'package:tennis_scoreboard/app/modules/post_match_countdown/bindings/post_match_countdown_binding.dart';
import 'package:tennis_scoreboard/app/modules/post_match_countdown/views/post_match_countdown_view.dart';
import 'package:tennis_scoreboard/app/modules/results/bindings/results_binding.dart';
import 'package:tennis_scoreboard/app/modules/results/views/results_view.dart';
import 'package:tennis_scoreboard/app/modules/start/bindings/start_binding.dart';
import 'package:tennis_scoreboard/app/modules/start/views/start_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.MATCH,
      page: () => const MatchView(),
      binding: MatchBinding(),
    ),
    GetPage(
      name: _Paths.POST_MATCH,
      page: () => const PostMatchResultView(),
      binding: PostMatchBinding(),
    ),
    GetPage(
      name: _Paths.POST_MATCH_COUNTDOWN,
      page: () => const PostMatchCountdownView(),
      binding: PostMatchCountdownBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS,
      page: () => const ResultsView(),
      binding: ResultsBinding(),
    ),
  ];
}
