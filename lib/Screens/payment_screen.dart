import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/Payment_Bottom_sheet.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_2.dart';
import 'home_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showSheetBottom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: !showSheetBottom ? null : PaymentBottomSheet(),
      backgroundColor: CustomColors.aBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.addPaymentScreen,
          radius: 28.r,
          bgColor: CustomColors.splashScreen,
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              showSheetBottom = false;
            });
          },
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 1192.h),
              Container(
                height: 180.h,
                width: double.infinity,
                color: CustomColors.aBackground,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 35.h, bottom: 30.h),
                  child: CustomButton(
                    size: 31.sp,
                    height: 65.h,
                    radius: 50.r,
                    width: double.infinity,
                    weight: FontWeight.w600,
                    color: CustomColors.textColor,
                    text: Constants.addCreditDebitCard,
                    bgColor: CustomColors.splashScreen,
                    onPressed: () {
                      setState(() {
                        showSheetBottom = true;
                      });
                    },
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
