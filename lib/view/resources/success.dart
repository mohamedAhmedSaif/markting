import 'package:flutter/material.dart';
import 'package:proo/core/resources/colors_manager.dart';
import 'package:proo/view/resources/forget.dart';

import '../../core/resources/border_radius_manager.dart';
import '../../core/resources/font_manager.dart';
import '../../core/resources/height_manager.dart';
import '../../core/resources/utils.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black38Color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.lightGreenColor,
                radius: BorderRadiusManager.br50,
                child: Icon(Icons.check, color: ColorsManager.whiteColor, size: FontSizeManger.f40),
              ),
               SizedBox(height: HeightManager.h20),
              Text(
                Utils.kCongratulations_2,
                style: TextStyle(fontSize: FontSizeManger.f22, color: ColorsManager.whiteColor, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: HeightManager.h10),
              Text(
                Utils.kCongratulations_3,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorsManager.white70Color),
              ),
               SizedBox(height: HeightManager.h40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.lightGreenColor,
                  padding: EdgeInsets.symmetric(horizontal: BorderRadiusManager.br40, vertical: BorderRadiusManager.br15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                  ),
                ),
                child: Text(Utils.kDone, style: TextStyle(fontSize: FontSizeManger.f16, color: ColorsManager.whiteColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
