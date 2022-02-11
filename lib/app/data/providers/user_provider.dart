import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/data/models/user_model.dart';

class UserProvider {
  Future<List<UserModel>> getUser({
    required String token,
    required int idUser,
  }) async {
    final _dio = Dio();
    final _response = await _dio.get(
      kBaseUrl + "api/user/information/$idUser",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
    );

    print(_response.data["information"]);
    return (_response.data["information"] as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }

  Future<String> insert({
    required UserModel userModel,
  }) async {
    final _dio = Dio();
    final _response = await _dio.post(
      kBaseUrl + "api/user/register",
      data: json.encode(userModel.toJson()),
    );
    return _response.data["message"];
  }
}
