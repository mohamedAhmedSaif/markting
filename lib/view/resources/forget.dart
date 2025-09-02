import 'package:flutter/material.dart';

import '../../core/resources/border_radius_manager.dart';
import '../../core/resources/colors_manager.dart';
import '../../core/resources/font_manager.dart';
import '../../core/resources/height_manager.dart';
import '../../core/resources/utils.dart';
import 'otp.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black38Color,
      appBar: AppBar(
        title: Text(Utils.kForgetPassword),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.kSelectWhichContactDetailsShouldWeUseToResetYourPassword,
              style: TextStyle(color: ColorsManager.white70Color, fontSize: FontSizeManger.f16),
            ),
             SizedBox(height: HeightManager.h30),
            _buildOption(Icons.email, Utils.kViaEmail, Utils.kEmail),
             SizedBox(height: HeightManager.h20),
            _buildOption(Icons.sms, Utils.kViaSms, Utils.kPhone),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.lightGreenColor,
                  padding: EdgeInsets.symmetric(horizontal: BorderRadiusManager.br40, vertical: BorderRadiusManager.br15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                  ),
                ),
                child: Text(Utils.kContinue, style: TextStyle(fontSize: FontSizeManger.f16, color: ColorsManager.whiteColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
              Text(subtitle, style: TextStyle(color: Colors.white70)),
            ],
          )
        ],
      ),
    );
  }
}
