import 'package:g57_find_home/app/data/models/house_model.dart';
import 'package:g57_find_home/app/data/providers/house_provider.dart';
import 'package:get/get.dart';

class HouseRepository {
  final _apiProvider = Get.find<HouseProvider>();

  Future<List<HouseModel>> getHouses({
    required String token,
  }) =>
      _apiProvider.getHouses(token: token);
}
