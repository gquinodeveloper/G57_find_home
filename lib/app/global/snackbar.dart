import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:get/get.dart';

class Snackbar {
  static void show({
    required String title,
    required String message,
    int type = 0,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: type == 0 ? AppTheme.cyan : Colors.pink,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
    );
  }
}
