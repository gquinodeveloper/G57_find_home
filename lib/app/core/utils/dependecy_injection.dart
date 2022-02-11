import 'package:g57_find_home/app/data/providers/house_provider.dart';
import 'package:g57_find_home/app/data/providers/local/auth_storage_provider.dart';
import 'package:g57_find_home/app/data/providers/reservation_provider.dart';
import 'package:g57_find_home/app/data/repositories/house_repository.dart';
import 'package:g57_find_home/app/data/repositories/local/auth_storage_repository.dart';

import 'package:g57_find_home/app/data/providers/auth_provider.dart';
import 'package:g57_find_home/app/data/repositories/auth_repository.dart';

import 'package:g57_find_home/app/data/providers/user_provider.dart';
import 'package:g57_find_home/app/data/repositories/reservation_repository.dart';
import 'package:g57_find_home/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void load() {
    //Providers
    Get.put<AuthProvider>(AuthProvider());
    Get.put<UserProvider>(UserProvider());
    Get.put<HouseProvider>(HouseProvider());
    Get.put<ReservationProvider>(ReservationProvider());

    //Local
    Get.put<AuthStorageProvider>(AuthStorageProvider());

    //Repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<UserRepository>(UserRepository());
    Get.put<HouseRepository>(HouseRepository());
    Get.put<ReservationRepository>(ReservationRepository());

    //Local
    Get.put<AuthStorageRepository>(AuthStorageRepository());
  }
}
