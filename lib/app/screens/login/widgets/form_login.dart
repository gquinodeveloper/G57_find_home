import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/global/input_text.dart';
import 'package:g57_find_home/app/global/primary_button.dart';
import 'package:g57_find_home/app/routes/app_routes.dart';
import 'package:g57_find_home/app/screens/login/login_controller.dart';
import 'package:get/get.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: EdgeInsets.only(bottom: constraint.maxHeight * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: AppTheme.blueDark,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "Login form enjoy findhome",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 50.0),
                InputText(
                  iconPrefix: Icons.email_outlined,
                  iconColor: AppTheme.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  filled: false,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppTheme.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  onChanged: (value) {
                    _.onChangeEmail(value);
                  },
                ),
                const SizedBox(height: 20.0),
                InputText(
                  iconPrefix: Icons.lock,
                  iconColor: AppTheme.light,
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  filled: false,
                  obscureText: true,
                  maxLines: 1,
                  enabledBorderColor: Colors.black26,
                  focusedBorderColor: AppTheme.cyan,
                  fontSize: 14.0,
                  fontColor: Colors.black45,
                  suffixIcon: Icon(Icons.visibility, color: AppTheme.light),
                  onChanged: _.onChangePassword,
                ),
                const SizedBox(height: 30.0),
                PrimaryButton(texto: "Sign in", onPressed: _.doAuth
                    /* onPressed: () {
                    _.doAuth();
                  }, */
                    ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Forgot password",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black54),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.SIGNUP);
                      },
                      child: Text(
                        "Create new account",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: AppTheme.blueDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
