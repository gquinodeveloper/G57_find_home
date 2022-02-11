import 'package:dio/dio.dart';
import 'package:g57_find_home/app/data/models/auth_model.dart';
import 'package:g57_find_home/app/data/models/house_model.dart';
import 'package:g57_find_home/app/data/models/reservation_model.dart';
import 'package:g57_find_home/app/data/repositories/local/auth_storage_repository.dart';
import 'package:g57_find_home/app/data/repositories/reservation_repository.dart';
import 'package:g57_find_home/app/global/load_spinner.dart';
import 'package:g57_find_home/app/global/snackbar.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  //Instancias
  final _reservationRepository = Get.find<ReservationRepository>();
  final _authStorageRepository = Get.find<AuthStorageRepository>();
  HouseModel house = HouseModel();
  AuthModel authModel = AuthModel();
  //Variables
  String _date = "";

  //funciones
  void onChangeDate(String value) => _date = value;

  @override
  void onInit() {
    _loadSession();
    house = Get.arguments as HouseModel;
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

  _loadSession() async {
    try {
      authModel = await _authStorageRepository.getSession(key: "auth");
    } on DioError catch (e) {
      Snackbar.show(
        title: "Error Session",
        message: e.toString(),
      );
    }
  }

  void save() async {
    LoadSpinner.show();
    try {
      String _response = "";
      ReservationModel reservation = ReservationModel(
        idUser: authModel.idUser,
        idHouse: house.idHouse,
        date: _date,
        price: house.price,
      );

      _response = await _reservationRepository.insert(
        token: "${authModel.requestToken}",
        reservation: reservation,
      );
      LoadSpinner.hide();
      Snackbar.show(
        title: "Felicitaciones",
        message: _response,
      );
    } on DioError catch (e) {
      LoadSpinner.hide();
      Snackbar.show(
        title: "Error Reservation",
        message: e.toString(),
        type: 1,
      );
    }
  }
}
