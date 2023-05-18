import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/home_screen.dart';
import '../constants.dart';
import 'custom_button_2.dart';
import 'custom_text.dart';
import 'enter_data_field.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({Key? key}) : super(key: key);

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 0.3,
      backgroundColor: CustomColors.bBackground,
      enableDrag: false,
      onClosing: () {
        Navigator.pop(context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.r),
        ),
      ),
      builder: (BuildContext ctx) => SizedBox(
        height: 800.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 3.h,
                  width: 150.w,
                  color: CustomColors.aBackground,
                ),
              ),
              SizedBox(height: 75.h),
              Padding(
                padding: EdgeInsets.only(left: 35.w),
                child: CustomText(
                  text: 'Name on Card',
                  color: CustomColors.textColor,
                  weight: FontWeight.w400,
                  textSize: 32.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextField2(
                width: double.infinity,
                hintText: Constants.name,
                controller: cardNameController,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(
                    color: CustomColors.textColor,
                    width: 0.5.w,
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.only(left: 35.w),
                child: CustomText(
                  text: 'Card number',
                  color: CustomColors.textColor,
                  weight: FontWeight.w400,
                  textSize: 32.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextField2(
                width: double.infinity,
                hintText: 'xxxx-xxxx-xxxx-xxxx',
                controller: cardNumberController,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(
                    color: CustomColors.textColor,
                    width: 0.5.w,
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: CustomText(
                          text: 'Expiry date',
                          color: CustomColors.textColor,
                          weight: FontWeight.w400,
                          textSize: 32.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField2(
                        width: 310.w,
                        hintText: 'mm/yy',
                        controller: cardNameController,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(
                            color: CustomColors.textColor,
                            width: 0.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: CustomText(
                          text: 'CVV',
                          color: CustomColors.textColor,
                          weight: FontWeight.w400,
                          textSize: 32.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField2(
                        width: 310.w,
                        hintText: 'cvv',
                        controller: cardNameController,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(
                            color: CustomColors.textColor,
                            width: 0.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70.h),
              CustomButton(
                size: 32.sp,
                radius: 50.r,
                height: 88.h,
                text: 'Confirm',
                width: double.infinity,
                weight: FontWeight.w600,
                color: CustomColors.textColor,
                bgColor: CustomColors.splashScreen,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
