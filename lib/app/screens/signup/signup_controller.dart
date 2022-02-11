import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/utils/validator.dart';
import 'package:g57_find_home/app/data/models/user_model.dart';
import 'package:g57_find_home/app/data/repositories/user_repository.dart';
import 'package:g57_find_home/app/global/load_spinner.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //Instancias
  final _userRepository = Get.find<UserRepository>();

  //Variables
  String _name = "";
  String _lastname = "";
  String _adress = "";
  String _email = "";
  String _password = "";

  //funciones
  void onChangeName(String value) => _name = value;
  void onChangeLastName(String value) => _lastname = value;
  void onChangeAdress(String value) => _adress = value;
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

  save() async {
    LoadSpinner.show();
    try {
      UserModel userModel = UserModel(
        name: _name,
        lastname: _lastname,
        adress: _adress,
        email: _email,
        password: _password,
      );
      String _message = await _userRepository.insert(userModel: userModel);
      LoadSpinner.hide();
      Get.snackbar(
        "Success",
        _message,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.cyan,
        colorText: Colors.white,
      );

      print(_message);
    } on DioError catch (e) {
      LoadSpinner.hide();
      Get.snackbar(
        "Error Auth",
        e.response?.data['message'],
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.pink[700],
        colorText: Colors.white,
      );
    }
  }
}
