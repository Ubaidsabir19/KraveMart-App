import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../Screens/home_screen.dart';
import '../constants.dart';
import 'custom_text.dart';
import 'otp_or_phone_field.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  bool value = false;
  String phone = "";
  bool isTextFiledFocus = false;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController phoneController1 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();
  TextEditingController phoneController3 = TextEditingController();
  TextEditingController phoneController4 = TextEditingController();
  TextEditingController phoneController5 = TextEditingController();
  TextEditingController phoneController6 = TextEditingController();
  TextEditingController phoneController7 = TextEditingController();
  TextEditingController phoneController8 = TextEditingController();
  TextEditingController phoneController9 = TextEditingController();
  TextEditingController phoneController10 = TextEditingController();

  //TextEditingController otpController = TextEditingController();

  updatePhoneText() {
    phone = phoneController1.text +
        phoneController2.text +
        phoneController3.text +
        phoneController4.text +
        phoneController5.text +
        phoneController6.text +
        phoneController7.text +
        phoneController8.text +
        phoneController9.text +
        phoneController10.text;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        elevation: 0,
        backgroundColor: CustomColors.aBackground,
        enableDrag: false,
        onClosing: () {
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(28.r),
        )),
        builder: (BuildContext ctx) => !value
            ? SizedBox(
                height: 420.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 28.w, top: 35.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: CustomText(
                          text: Constants.letSignYouIn,
                          color: CustomColors.textColor,
                          weight: FontWeight.w700,
                          textSize: 48.sp,
                        ),
                      ),
                      SizedBox(height: 80.h),
                      Padding(
                        padding: EdgeInsets.only(right: 25.w, left: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 70.h),
                              child: CustomText(
                                text: Constants.ninetyTwo,
                                color: CustomColors.hintColor,
                                weight: FontWeight.w600,
                                textSize: 40.sp,
                              ),
                            ),
                            SingleTextField(
                              controller: phoneController1,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController2,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController3,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController4,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController5,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController6,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController7,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController8,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController9,
                              width: 18.w,
                              height: 40.h,
                            ),
                            SingleTextField(
                              controller: phoneController10,
                              width: 18.w,
                              height: 40.h,
                            ),
                          ],
                        ),
                      ),
                      //SizedBox(height: 60.h),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            value = true;
                          });
                          updatePhoneText();
                        },
                        child: Card(
                          elevation: 0.05,
                          color: CustomColors.splashScreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          child: SizedBox(
                            height: 90.h,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.Continue,
                                    color: CustomColors.textColor,
                                    weight: FontWeight.w600,
                                    textSize: 30.sp,
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: CustomColors.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: 420.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColors.aBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 28.w, top: 35.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: Constants.codeSent + phone,
                        color: CustomColors.textColor,
                        weight: FontWeight.w400,
                        textSize: 36.sp,
                      ),
                      SizedBox(height: 45.h),
                      OtpTextField(
                        autoFocus: true,
                        numberOfFields: 4,
                        borderColor: Colors.black,
                        focusedBorderColor: CustomColors.splashScreen,
                        showFieldAsBox: false,
                        borderWidth: 4.w,
                        onCodeChanged: (String code) {
                          //handle validation or checks here if necessary
                        },
                        onSubmit: (String verificationCode) {},
                      ),
                      SizedBox(height: 80.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                        },
                        child: Card(
                          elevation: 0.05,
                          color: CustomColors.splashScreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.r),
                          ),
                          child: SizedBox(
                            height: 90.h,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.w, right: 25.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.continues,
                                    color: CustomColors.textColor,
                                    weight: FontWeight.w600,
                                    textSize: 30.sp,
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: CustomColors.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
