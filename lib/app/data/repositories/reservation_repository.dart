import 'package:g57_find_home/app/data/models/reservation_model.dart';
import 'package:g57_find_home/app/data/providers/reservation_provider.dart';
import 'package:get/get.dart';

class ReservationRepository {
  final _apiProvider = Get.find<ReservationProvider>();

  Future<String> insert({
    required String token,
    required ReservationModel reservation,
  }) =>
      _apiProvider.insert(token: token, reservation: reservation);
}
