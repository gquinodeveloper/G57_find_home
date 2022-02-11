import 'package:g57_find_home/app/data/models/user_model.dart';
import 'package:g57_find_home/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<List<UserModel>> getUser({
    required String token,
    required int idUser,
  }) =>
      _apiProvider.getUser(token: token, idUser: idUser);

  Future<String> insert({
    required UserModel userModel,
  }) =>
      _apiProvider.insert(userModel: userModel);
}
