import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/core/utils/validator.dart';
import 'package:g57_find_home/app/data/models/auth_model.dart';
import 'package:g57_find_home/app/data/repositories/local/auth_storage_repository.dart';
import 'package:g57_find_home/app/global/load_spinner.dart';
import 'package:g57_find_home/app/global/snackbar.dart';
import 'package:g57_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:g57_find_home/app/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  //Instancias
  final _authRepository = Get.find<AuthRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();

  AuthModel _authModel = AuthModel();

  //Variables
  String _email = "gqcrispin@gmail.com";
  String _password = "123456";

  //funciones
  void onChangeEmail(String value) => _email = Validator.validateEmail(value);
  void onChangePassword(String value) => _password = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  doAuth() async {
    LoadSpinner.show();
    try {
      _authModel = await _authRepository.auth(
        email: _email,
        password: _password,
      );

      //Persistir datos en STORAGE
      await _authStorageRepository.setSession(
        key: "auth",
        authModel: _authModel,
      );

      LoadSpinner.hide();
      if (_authModel.success == true) {
        Get.offNamed(AppRoutes.HOME);
      }
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error Auth",
        message: e.response?.data['message'],
        type: 1,
      );
    }
  }
}
