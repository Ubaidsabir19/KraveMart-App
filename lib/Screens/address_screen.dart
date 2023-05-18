import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/location_selection.dart';
import 'package:krave_market/widgets/custom_text.dart';
import '../constants.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_2.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key, this.address}) : super(key: key);
  final String? address;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.address,
          radius: 28.r,
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
              SizedBox(
                height: 1195.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w, right: 26.w, top: 45.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.aBackground,
                          border: Border.all(width: 1.7.w),
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 23.w, right: 26.w, top: 30.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.radio_button_unchecked_sharp,
                                        color: CustomColors.splashScreen,
                                        size: 32.h,
                                      ),
                                      SizedBox(width: 18.w),
                                      CustomText(
                                        text: Constants.home,
                                        color: CustomColors.textColor,
                                        textSize: 30.sp,
                                        weight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/Pencil.png',
                                          color: CustomColors.textColor,
                                          height: 32.h,
                                          width: 33.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 50.w, right: 20.w),
                                child: CustomText(
                                  text: Constants.desLocation,
                                  color: CustomColors.textColor,
                                  textSize: 29.sp,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 45.h),
                            ],
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
                color: CustomColors.aBackground,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 35.h, bottom: 30.h),
                  child: CustomButton(
                    height: 65.h,
                    width: double.infinity,
                    bgColor: CustomColors.splashScreen,
                    text: Constants.addNewAddress,
                    size: 31.sp,
                    color: CustomColors.textColor,
                    radius: 50.r,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationSelectionScreen()),
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
