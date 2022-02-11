import 'package:g57_find_home/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    _doLogin();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  _doLogin() async {
    try {
      await Future.delayed(
        Duration(seconds: 2),
        () => Get.offNamed(AppRoutes.LOGIN),
      );
    } catch (e) {
      print(e);
    }
  }
}
