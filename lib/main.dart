import 'package:flutter/material.dart';
import 'package:g57_find_home/app/routes/app_pages.dart';
import 'package:g57_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

import 'app/core/utils/dependecy_injection.dart';

void main() {
  DependencyInjection.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Find Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
