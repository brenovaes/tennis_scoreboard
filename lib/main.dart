import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tennis_scoreboard/app/ui/theme/palette.dart';

import 'app/routes/app_pages.dart';

void main() {
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
