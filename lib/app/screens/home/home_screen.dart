import 'package:flutter/material.dart';
import 'package:g57_find_home/app/global/button_navigator.dart';
import 'package:g57_find_home/app/screens/home/widgets/category.dart';
import 'package:g57_find_home/app/screens/home/widgets/header.dart';
import 'package:g57_find_home/app/screens/home/widgets/houses.dart';
import 'package:g57_find_home/app/screens/home/widgets/search.dart';
import 'package:get/get.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/screens/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    Header(),
                    Search(),
                    Category(),
                    Obx(
                      () => getView(_.isSelectedIndex.value),
                    ),
                  ],
                ),
              ),
              ButtonNavigator()
            ],
          ),
        ),
      ),
    );
  }
}

Widget getView(int indexView) {
  print("getView" + indexView.toString());
  switch (indexView) {
    case 0:
      return Houses();
    case 1:
      return Condominio();
    case 2:
      return KeysHouse();
    case 3:
      return Offerts();
    default:
  }

  return Houses();
}

class Condominio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Text("Condominio"));
  }
}

class KeysHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text("KeysHouse"),
    );
  }
}

class Offerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: const Text("Offerts"),
    );
  }
}
