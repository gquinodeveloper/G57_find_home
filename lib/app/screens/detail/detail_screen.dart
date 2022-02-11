import 'package:flutter/material.dart';
import 'package:g57_find_home/app/screens/detail/detail_controller.dart';
import 'package:g57_find_home/app/screens/detail/widgets/appbar_actions.dart';
import 'package:g57_find_home/app/screens/detail/widgets/content.dart';
import 'package:g57_find_home/app/screens/detail/widgets/footer.dart';
import 'package:g57_find_home/app/screens/detail/widgets/header.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => Scaffold(
        //appBar: AppBar(),
        body: Stack(
          children: [
            Header(path: _.house.photo ?? ""),
            AppBarActions(aviable: _.house.aviable ?? 0),
            Content(house: _.house),
            Footer(house: _.house),
          ],
        ),
      ),
    );
  }
}
