import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/home_screen.dart';
import 'package:krave_market/constants.dart';
import 'package:krave_market/widgets/custom_text.dart';

import '../widgets/custom_button_2.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/location.png'),
              ),
              CustomText(
                text: Constants.kM,
                color: CustomColors.textColor,
                textSize: 42.sp,
                weight: FontWeight.w700,
              ),
              CustomText(
                text: Constants.yl,
                color: CustomColors.textColor,
                textSize: 42.sp,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 25.h),
              CustomText(
                text: Constants.lsDescription,
                color: CustomColors.textColor,
                textSize: 25.sp,
                weight: FontWeight.w400,
              ),
              CustomText(
                textSize: 25.sp,
                text: Constants.pdo,
                weight: FontWeight.w400,
                color: CustomColors.textColor,
              ),
              SizedBox(height: 30.h),
              CustomButton(
                size: 31.sp,
                radius: 48.r,
                height: 90.h,
                text: Constants.uml,
                width: double.infinity,
                weight: FontWeight.w600,
                color: CustomColors.textColor,
                bgColor: CustomColors.splashScreen,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
