import 'package:flutter/material.dart';
import 'package:g57_find_home/app/core/theme/app_theme.dart';
import 'package:g57_find_home/app/data/models/house_model.dart';
import 'package:g57_find_home/app/global/input_text.dart';
import 'package:g57_find_home/app/global/primary_button.dart';
import 'package:g57_find_home/app/screens/detail/detail_controller.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  @override
  FooterState createState() => FooterState();

  Footer({
    required this.house,
  });
  final HouseModel house;
}

class FooterState extends State<Footer> {
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$${widget.house.price} USD",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppTheme.blueDark, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => _settingModalBottomSheet(context),
              child: Container(
                width: 170.0,
                height: 45.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.cyan,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  "Reserved Now!",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => GetBuilder<DetailController>(
        builder: (_) => Container(
          height: 400.0,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reserved",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppTheme.blueDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30.0),
              InputText(
                iconPrefix: Icons.date_range,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.datetime,
                labelText: "Date",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                fontSize: 14.0,
                fontColor: Colors.black45,
                onChanged: _.onChangeDate,
              ),
              const SizedBox(height: 20.0),
              InputText(
                initialValue: "\$ ${_.house.price}",
                iconPrefix: Icons.monetization_on,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.number,
                labelText: "Price",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                readOnly: true,
                fontSize: 14.0,
                fontColor: Colors.black45,
              ),
              const SizedBox(height: 50.0),
              PrimaryButton(
                texto: "Save",
                onPressed: _.save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
