import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/screens/signup/widgets/form_signup.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .75,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: FormSignUp(),
      ),
    );
  }
}
