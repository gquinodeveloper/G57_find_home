import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:g57_find_home/app/data/models/auth_model.dart';
import 'package:g57_find_home/app/data/models/house_model.dart';
import 'package:g57_find_home/app/data/models/user_model.dart';
import 'package:g57_find_home/app/data/repositories/house_repository.dart';
import 'package:g57_find_home/app/data/repositories/local/auth_storage_repository.dart';
import 'package:g57_find_home/app/data/repositories/user_repository.dart';
import 'package:g57_find_home/app/global/load_spinner.dart';
import 'package:g57_find_home/app/global/snackbar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Instancias
  final _houseRepository = Get.find<HouseRepository>();
  final _userRepository = Get.find<UserRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();

  AuthModel authModel = AuthModel();

  //Variables
  RxInt isSelectedIndex = RxInt(0);
  RxList<HouseModel> houses = RxList<HouseModel>([]);
  RxList<UserModel> users = RxList<UserModel>([]);

  //funciones
  @override
  void onInit() {
    _loadSession();
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

  selectedIndex(int index) {
    isSelectedIndex.value = index;
  }

  _loadSession() async {
    try {
      authModel = await _authStorageRepository.getSession(key: "auth");
      _loadInformation();
      _loadHouses();
    } catch (e) {
      Snackbar.show(
        title: "Error Auth",
        message: e.toString(),
      );
    }
  }

  _loadHouses() async {
    try {
      houses.value = await _houseRepository.getHouses(
        token: "${authModel.requestToken}",
      );
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error load houses",
        message: e.response?.data['message'],
        type: 1,
      );
    }
  }

  _loadInformation() async {
    try {
      users.value = await _userRepository.getUser(
        token: "${authModel.requestToken}",
        idUser: authModel.idUser ?? 0,
      );
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error load houses",
        message: e.response?.data['message'],
        type: 1,
      );
    }
  }
}
