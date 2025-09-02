import 'package:flutter/material.dart';
import 'package:proo/core/resources/colors_manager.dart';
import 'package:proo/core/resources/font_manager.dart';
import 'package:proo/core/resources/utils.dart';
import 'package:proo/view/resources/success.dart';

import '../../core/resources/border_radius_manager.dart';
import '../../core/resources/height_manager.dart';

class FingerprintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorsManager.black38Color,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(Utils.SetYourFingerprint),
        centerTitle: true,
      backgroundColor: ColorsManager.black38Color,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, size: FontSizeManger.f120, color: ColorsManager.lightGreenColor),
             SizedBox(height: HeightManager.h20),
            Text(
              Utils.AddAFingerprintToMakeYourAccountMoreSecure,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorsManager.white70Color, fontSize: FontSizeManger.f16),
            ),
             SizedBox(height: HeightManager.h40),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.lightGreenColor,
                padding: EdgeInsets.symmetric(horizontal: BorderRadiusManager.br40, vertical: BorderRadiusManager.br15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                ),
              ),
              child: Text(Utils.kContinue, style: TextStyle(fontSize: FontSizeManger.f16)),
            ),
          ],
        ),
      ),
    );
  }
}
