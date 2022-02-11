import 'package:dio/dio.dart';
import 'package:g57_find_home/app/core/config/app_config.dart';
import 'package:g57_find_home/app/data/models/house_model.dart';

class HouseProvider {
  Future<List<HouseModel>> getHouses({
    required String token,
  }) async {
    final _dio = Dio();
    final _response = await _dio.get(
      kBaseUrl + "api/house/houses/1/6",
      options: Options(
        headers: {
          "auth": token,
        },
      ),
    );

    return (_response.data["result"] as List)
        .map((json) => HouseModel.fromJson(json))
        .toList();
  }
}
