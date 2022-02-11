import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/data/models/auth_model.dart';
import 'package:get/get.dart';

class AuthStorageProvider {
  final _storage = Get.put(const FlutterSecureStorage());

  Future<void> setSession({
    required String key,
    required AuthModel authModel,
  }) async {
    await _storage.write(
      key: key,
      value: jsonEncode(authModel.toJson()),
    );
  }

  Future<AuthModel> getSession({
    required String key,
  }) async {
    String json = await _storage.read(key: key) ?? "";
    return AuthModel.fromJson(jsonDecode(json));
  }
}
