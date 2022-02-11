import 'package:dio/dio.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/data/models/auth_model.dart';

class AuthProvider {
  Future<AuthModel> auth({
    required String email,
    required String password,
  }) async {
    final _dio = Dio();
    final _response = await _dio.post(
      kBaseUrl + "api/user/auth",
      data: {
        "email": email,
        "password": password,
      },
    );
    return AuthModel.fromJson(_response.data);
  }
}
