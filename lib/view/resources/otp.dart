import 'package:flutter/material.dart';
import 'package:proo/core/resources/border_radius_manager.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/resources/font_manager.dart';
import '../../core/resources/height_manager.dart';
import '../../core/resources/utils.dart';
import '../../core/resources/width_manager.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otp = [Utils.kspace, Utils.kspace, Utils.kspace,Utils.kspace];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black38Color,
      appBar: AppBar(
        title: Text(Utils.kOtp),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(Utils.kCodeHasBeenSentToYourNumber,
                  style: TextStyle(color: ColorsManager.white70Color)),
              SizedBox(height: HeightManager.h30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return _otpBox(otp[index]);
                }),
              ),
               SizedBox(height: HeightManager.h30),
              Text(Utils.kResendOtp_1, style: TextStyle(color: ColorsManager.lightGreenColor)),
               SizedBox(height: HeightManager.h30),
              _buildKeypad(),
               SizedBox(height: HeightManager.h20),
              ElevatedButton(
                onPressed: () {
                  // Verify code logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.lightGreenColor,
                  padding: EdgeInsets.symmetric(horizontal: BorderRadiusManager.br40, vertical: BorderRadiusManager.br15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BorderRadiusManager.br30),
                  ),
                ),
                child: Text(Utils.kVerify, style: TextStyle(fontSize: FontSizeManger.f16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(String value) {
    return Container(
      width: WidthManager.w50,
      height: HeightManager.h50,
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreenColor),
        borderRadius: BorderRadius.circular(BorderRadiusManager.br10),
      ),
      alignment: Alignment.center,
      child: Text(value, style: TextStyle(color: ColorsManager.whiteColor, fontSize: FontSizeManger.f16)),
    );
  }

  Widget _buildKeypad() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (_, index) {
        if (index == 9) return SizedBox.shrink(); // خانة فارغة

        // زر المسح
        if (index == 11) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (int i = otp.length - 1; i >= 0; i--) {
                  if (otp[i].isNotEmpty) {
                    otp[i] = "";
                    break;
                  }
                }
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(Icons.backspace, color: ColorsManager.whiteColor),
            ),
          );
        }

        // الأرقام
        String value = index == 10 ? "0" : "${index + 1}";
        return GestureDetector(
          onTap: () {
            setState(() {
              for (int i = 0; i < otp.length; i++) {
                if (otp[i].isEmpty) {
                  otp[i] = value;
                  break;
                }
              }
            });
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(value, style: TextStyle(color: ColorsManager.whiteColor, fontSize: FontSizeManger.f20)),
          ),
        );
      },
    );
  }
}
