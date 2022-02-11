import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/global/input_text.dart';
import 'package:g57_find_home/app/global/primary_button.dart';
import 'package:g57_find_home/app/routes/app_routes.dart';
import 'package:g57_find_home/app/screens/signup/signup_controller.dart';
import 'package:get/get.dart';

class FormSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: AppTheme.blue, fontWeight: FontWeight.w900),
          ),
          Text(
            "Create a new account",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.black38, fontWeight: FontWeight.w400),
          ),
          //const SizedBox(height: 25.0),
          InputText(
            iconPrefix: Icons.person_outline,
            iconColor: AppTheme.light,
            border: InputBorder.none,
            keyboardType: TextInputType.emailAddress,
            validator: null,
            labelText: "Name",
            filled: false,
            enabledBorderColor: Colors.black26,
            focusedBorderColor: AppTheme.cyan,
            fontSize: 14.0,
            fontColor: Colors.black45,
            onChanged: _.onChangeName,
          ),
          const SizedBox(height: 20.0),
          InputText(
            iconPrefix: Icons.bubble_chart_outlined,
            iconColor: AppTheme.light,
            border: InputBorder.none,
            keyboardType: TextInputType.emailAddress,
            validator: null,
            labelText: "Last Name",
            filled: false,
            enabledBorderColor: Colors.black26,
            focusedBorderColor: AppTheme.cyan,
            fontSize: 14.0,
            fontColor: Colors.black45,
            onChanged: _.onChangeLastName,
          ),
          const SizedBox(height: 20.0),
          InputText(
            iconPrefix: Icons.directions_outlined,
            iconColor: AppTheme.light,
            border: InputBorder.none,
            keyboardType: TextInputType.emailAddress,
            validator: null,
            labelText: "Adress",
            filled: false,
            enabledBorderColor: Colors.black26,
            focusedBorderColor: AppTheme.cyan,
            fontSize: 14.0,
            fontColor: Colors.black45,
            onChanged: _.onChangeAdress,
          ),
          const SizedBox(height: 20.0),
          InputText(
            iconPrefix: Icons.email_outlined,
            iconColor: AppTheme.light,
            border: InputBorder.none,
            keyboardType: TextInputType.emailAddress,
            validator: null,
            labelText: "Email",
            filled: false,
            enabledBorderColor: Colors.black26,
            focusedBorderColor: AppTheme.cyan,
            fontSize: 14.0,
            fontColor: Colors.black45,
            onChanged: _.onChangeEmail,
          ),
          const SizedBox(height: 20.0),
          InputText(
            iconPrefix: Icons.lock_outline,
            iconColor: AppTheme.light,
            border: InputBorder.none,
            keyboardType: TextInputType.text,
            obscureText: true,
            maxLines: 1,
            validator: null,
            labelText: "Password",
            filled: false,
            enabledBorderColor: Colors.black26,
            focusedBorderColor: AppTheme.cyan,
            fontSize: 14.0,
            fontColor: Colors.black45,
            onChanged: _.onChangePassword,
          ),
          const SizedBox(height: 30.0),
          PrimaryButton(texto: "Sign Up", onPressed: _.save),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          Center(
            child: Text(
              "Already have an account",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.black38, fontWeight: FontWeight.w400),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Get.offNamed(AppRoutes.LOGIN),
              child: Text(
                "Sign In",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: AppTheme.blueDark, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
