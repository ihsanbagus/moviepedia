import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviepedia/app/core/environment.dart';
import 'package:moviepedia/app/core/themes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: myTheme,
      themeMode: ThemeMode.system,
    ),
  );
}
