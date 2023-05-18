import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/widgets/custom_text.dart';
import '../constants.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_2.dart';
import '../widgets/enter_data_field.dart';
import 'home_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.editProfile,
          radius: 30.r,
          //size: 34.sp,
          bgColor: CustomColors.splashScreen,
          onPressed: () {
            Navigator.of(context).pop();
          },
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1192.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w, right: 26.w, top: 45.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: CustomText(
                          text: Constants.name,
                          color: CustomColors.textColor,
                          textSize: 30.sp,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField2(
                        width: double.infinity,
                        hintText: Constants.name,
                        controller: nameController,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(
                            color: CustomColors.textColor,
                            width: 0.5.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: CustomText(
                          text: Constants.email,
                          color: CustomColors.textColor,
                          textSize: 30.sp,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField2(
                        width: double.infinity,
                        hintText: Constants.email,
                        controller: emailController,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45.r),
                          borderSide: BorderSide(
                            color: CustomColors.textColor,
                            width: 0.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColors.aBackground,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 35.h, bottom: 30.h),
                  child: CustomButton(
                    height: 70.h,
                    width: double.infinity,
                    bgColor: CustomColors.splashScreen,
                    text: Constants.save,
                    size: 32.sp,
                    color: CustomColors.textColor,
                    radius: 50.r,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
