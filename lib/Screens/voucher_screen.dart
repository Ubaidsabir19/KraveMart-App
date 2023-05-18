import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_2.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.voucher,
          radius: 28.r,
          bgColor: CustomColors.splashScreen,
          onPressed: () {
            Navigator.of(context).pop();
          },
          onTap: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 1312.h,
                  width: double.infinity,
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0.0,
                        backgroundColor: CustomColors.aBackground,
                        flexibleSpace: TabBar(
                          labelColor: CustomColors.textColor,
                          unselectedLabelColor: CustomColors.splashScreen,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: CustomColors.textColor,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 3.w, color: CustomColors.textColor),
                            insets: EdgeInsets.only(left: 20.w, right: 15.w),
                          ),
                          padding: EdgeInsets.only(right: 320.w),
                          tabs: const [
                            Tab(text: Constants.available),
                            Tab(text: Constants.used),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          Center(child: Icon(Icons.add)),
                          Center(child: Icon(Icons.add)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 470.w),
                  child: CustomButton(
                    text: Constants.refresh,
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
          ],
        ),
      ),
    );
  }
}
