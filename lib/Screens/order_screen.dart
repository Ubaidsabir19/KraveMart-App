import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/app_bar_general.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.aBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.orders,
          radius: 28.r,
          bgColor: CustomColors.splashScreen,
          onPressed: () {
            Navigator.of(context).pop();
          },
          onTap: () {},
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 60.h),
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
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 10.w),
                    child: TabBar(
                      labelColor: CustomColors.textColor,
                      unselectedLabelColor: CustomColors.splashScreen,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: CustomColors.textColor,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                            width: 3.w, color: CustomColors.textColor),
                        insets: EdgeInsets.only(left: 20.w, right: 10.w),
                      ),
                      padding: EdgeInsets.only(right: 340.w),
                      tabs: const [
                        Tab(text: Constants.current),
                        Tab(text: Constants.history),
                      ],
                    ),
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
        ],
      ),
    );
  }
}
