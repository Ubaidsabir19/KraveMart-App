import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/widgets/custom_text.dart';
import '../constants.dart';
import '../widgets/app_bar_general.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: 'Wallet',
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
            children: [
              Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    color: CustomColors.bBackground,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 26.w, right: 26.w, top: 60.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: Constants.walletAmount,
                            color: CustomColors.hintColor,
                            textSize: 32.sp,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(height: 40.h),
                          CustomText(
                            text: '00',
                            color: CustomColors.textColor,
                            textSize: 75.sp,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 290.h),
                    child: Column(
                      children: [
                        Container(
                          height: 1000.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: CustomColors.aBackground,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.r),
                              topRight: Radius.circular(40.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 45.w, right: 20.w, top: 50.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: Constants.transaction,
                                  color: CustomColors.hintColor,
                                  textSize: 34.sp,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
