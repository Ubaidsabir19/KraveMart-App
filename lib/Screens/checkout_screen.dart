import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/address_screen.dart';
import 'package:krave_market/Screens/payment_screen.dart';
import 'package:krave_market/Screens/voucher_screen.dart';
import 'package:krave_market/widgets/list_view_items.dart';
import 'package:krave_market/widgets/text_button.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/global_data_provider.dart';
import '../services/deal.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_2.dart';
import '../widgets/custom_button_1.dart';
import '../widgets/custom_button_3.dart';
import '../widgets/custom_text.dart';
import '../widgets/enter_data_field.dart';
import 'home_screen.dart';

class Checkout extends StatefulWidget {
  Checkout({
    Key? key,
    required this.dealslist,
    required this.price,
  }) : super(key: key);
  final List<Deal> dealslist;
  final String price;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.checkout,
          radius: 22.r,
          bgColor: CustomColors.splashScreen,
          onPressed: () {
            Navigator.of(context).pop();
          },
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 1180.h,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 50.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: Constants.personalInformation,
                        color: CustomColors.textColor,
                        textSize: 42.sp,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(height: 50.h),
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
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: Constants.address,
                            color: CustomColors.textColor,
                            textSize: 35.sp,
                            weight: FontWeight.w600,
                          ),
                          CustomTextButton(
                            text: Constants.changeAddress,
                            colors: CustomColors.textButtonColor,
                            size: 27.sp,
                            weight: FontWeight.w600,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddressScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 83.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColors.aBackground,
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: CustomColors.splashScreen,
                                    size: 40.h,
                                  ),
                                  SizedBox(width: 20.w),
                                  CustomText(
                                    text: Constants.desLocation,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: Constants.paymentMethod,
                            color: CustomColors.textColor,
                            textSize: 35.sp,
                            weight: FontWeight.w600,
                          ),
                          CustomTextButton(
                            text: Constants.paymentOptions,
                            colors: CustomColors.textButtonColor,
                            size: 27.sp,
                            weight: FontWeight.w600,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 82.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColors.aBackground,
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: CustomColors.splashScreen,
                                    size: 40.h,
                                  ),
                                  SizedBox(width: 20.w),
                                  CustomText(
                                    text: Constants.cashOnDelivery,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: Constants.voucherCode,
                            color: CustomColors.textColor,
                            textSize: 35.sp,
                            weight: FontWeight.w600,
                          ),
                          CustomTextButton(
                            text: Constants.selectVoucher,
                            colors: CustomColors.textButtonColor,
                            size: 27.sp,
                            weight: FontWeight.w600,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VoucherScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      Stack(
                        children: [
                          CustomTextField2(
                            width: double.infinity,
                            hintText: Constants.enterCodeHere,
                            controller: emailController,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.r),
                              borderSide: BorderSide(
                                color: CustomColors.textColor,
                                width: 0.5.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 470.w),
                            child: CustomButton(
                              text: Constants.apply,
                              onPressed: () {},
                              radius: 40.r,
                              width: 185.w,
                              height: 63.h,
                              size: 29.sp,
                              weight: FontWeight.w500,
                              color: CustomColors.textColor,
                              bgColor: CustomColors.splashScreen,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      CustomText(
                        text: Constants.orderSummary,
                        color: CustomColors.textColor,
                        textSize: 38.sp,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.aBackground,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 20.h),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.dealslist.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                text: widget
                                                    .dealslist[index].counter
                                                    .toString(),
                                                color: CustomColors.textColor,
                                                textSize: 29.sp,
                                                weight: FontWeight.w300,
                                              ),
                                              CustomText(
                                                text: Constants.x,
                                                color: CustomColors.textColor,
                                                textSize: 29.sp,
                                                weight: FontWeight.w300,
                                              ),
                                              SizedBox(width: 30.h),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 25.h),
                                                child: Column(
                                                  children: [
                                                    CustomText(
                                                      text: widget
                                                          .dealslist[index].name
                                                          .toString(),
                                                      color: CustomColors
                                                          .textColor,
                                                      textSize: 25.sp,
                                                      weight: FontWeight.w300,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                text: Constants.rs,
                                                color: CustomColors.textColor,
                                                textSize: 28.sp,
                                                weight: FontWeight.w400,
                                              ),
                                              SizedBox(width: 10.h),
                                              CustomText(
                                                text: widget.dealslist[index]
                                                    .price![0].range
                                                    .toString(),
                                                color: CustomColors.textColor,
                                                textSize: 28.sp,
                                                weight: FontWeight.w400,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                height: 0.2.h,
                                width: double.infinity,
                                color: CustomColors.hintColor,
                              ),
                              SizedBox(height: 45.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.subtotal,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: widget.price,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.deliveryFee,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w300,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: Provider.of<GlobalData>(context,
                                                listen: false)
                                            .Tax()
                                            .toString(),
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.serviceFee,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w300,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: Provider.of<GlobalData>(context,
                                                listen: false)
                                            .Fee()
                                            .toString(),
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.smallOrderFee,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w300,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: Constants.twenty,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.wallet,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Switch(
                                          onChanged: toggleSwitch,
                                          value: isSwitched,
                                          activeColor: Colors.blueAccent,
                                          activeTrackColor: Colors.grey,
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: '0',
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: Constants.total,
                                    color: CustomColors.textColor,
                                    textSize: 28.sp,
                                    weight: FontWeight.w700,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: Constants.rs,
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w700,
                                      ),
                                      SizedBox(width: 10.h),
                                      CustomText(
                                        text: Provider.of<GlobalData>(context,
                                                listen: false)
                                            .allPrice()
                                            .toString(),
                                        color: CustomColors.textColor,
                                        textSize: 28.sp,
                                        weight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 50.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 188.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.aBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r),
                  topLeft: Radius.circular(40.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton3(
                      bgColor: CustomColors.splashScreen,
                      height: 90.h,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      radius: 46.r,
                      text2: Provider.of<GlobalData>(context, listen: false)
                          .allPrice()
                          .toString(),
                      text: Constants.placeOrder,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
