import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/data/models/reservation_model.dart';

class ReservationProvider {
  Future<String> insert({
    required String token,
    required ReservationModel reservation,
  }) async {
    final _dio = Dio();
    final _response = await _dio.post(
      kBaseUrl + "api/reservation/register",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
      data: json.encode(reservation.toJson()),
    );

    return _response.data["message"];
  }
}
