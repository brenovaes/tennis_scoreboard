import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tennis_scoreboard/app/data/models/match_result_model.dart';
import 'package:tennis_scoreboard/app/ui/theme/palette.dart';

import 'app/routes/app_pages.dart';

Future<void> _initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MatchResultAdapter());

  Box<MatchResult> _matchesBox = await Hive.openBox<MatchResult>('matches');

  Get.put<Box<MatchResult>>(
    _matchesBox,
    permanent: true,
  );
}

void main() async {
  await _initHive();
  runApp(
    GetMaterialApp(
      title: "Tennis Scoreboard",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Palette.ktodark,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
