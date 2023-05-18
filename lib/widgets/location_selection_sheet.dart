import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/address_screen.dart';
import '../Screens/home_screen.dart';
import '../constants.dart';
import 'custom_button_2.dart';
import 'custom_text.dart';

class LocationSelectionSheet extends StatefulWidget {
  const LocationSelectionSheet({Key? key}) : super(key: key);

  @override
  State<LocationSelectionSheet> createState() => _LocationSelectionSheetState();
}

class _LocationSelectionSheetState extends State<LocationSelectionSheet> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 0.8,
      backgroundColor: CustomColors.aBackground,
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
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: CustomColors.aBackground,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(right: 20.w, left: 10.w),
                child: TabBar(
                  labelColor: CustomColors.textColor,
                  unselectedLabelColor: CustomColors.splashScreen,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: CustomColors.textColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: const BorderSide(
                        width: 2.3, color: CustomColors.textColor),
                    insets: EdgeInsets.only(left: 20.w, right: 20.w),
                  ),
                  padding: EdgeInsets.only(right: 340.w),
                  tabs: const [
                    Tab(text: 'Home'),
                    Tab(text: 'Office'),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          var address = Constants.desLocation;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddressScreen(address: address)),
                          );
                        },
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
                      SizedBox(height: 460.h),
                      CustomButton(
                        size: 32.sp,
                        radius: 50.r,
                        height: 88.h,
                        text: '+   Add New Address ',
                        width: double.infinity,
                        weight: FontWeight.w600,
                        color: CustomColors.textColor,
                        bgColor: CustomColors.splashScreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  child: Column(
                    children: [
                      SizedBox(height: 540.h),
                      CustomButton(
                        size: 32.sp,
                        radius: 50.r,
                        height: 88.h,
                        text: '+   Add New Address ',
                        width: double.infinity,
                        weight: FontWeight.w600,
                        color: CustomColors.textColor,
                        bgColor: CustomColors.splashScreen,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
