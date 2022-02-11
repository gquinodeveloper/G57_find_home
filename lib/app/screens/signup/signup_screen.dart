import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/screens/signup/signup_controller.dart';
import 'package:g57_find_home/app/screens/signup/widgets/content.dart';
import 'package:g57_find_home/app/screens/signup/widgets/header.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Header(),
              Content(),
            ],
          ),
        ),
      ),
    );
  }
}
