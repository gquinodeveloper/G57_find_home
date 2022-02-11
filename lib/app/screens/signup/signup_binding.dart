import 'package:get/get.dart';
import 'package:g57_find_home/app/screens/signup/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
