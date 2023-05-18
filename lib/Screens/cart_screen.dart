import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/constants.dart';
import 'package:provider/provider.dart';
import '../provider/global_data_provider.dart';
import '../services/deal.dart';
import '../widgets/app_bar_general.dart';
import '../widgets/custom_button_3.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required this.dealslist,
    required this.price,
    required this.items,
  }) : super(key: key);

  final List<Deal> dealslist;
  final String price;
  final String items;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double progress = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CategoryAppBar(
          icon1: Icons.keyboard_backspace_sharp,
          text1: Constants.cart,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1100.h,
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.dealslist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0.02,
                      color: CustomColors.aBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Container(
                        height: 292.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.w, right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 225.h,
                                  width: 180.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25.r),
                                    child: Image.asset(
                                      'assets/noodles.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 60.w),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: widget.dealslist[index].name
                                                  .toString() ??
                                              '',
                                          color: CustomColors.hintColor,
                                          textSize: 28.sp,
                                          weight: FontWeight.w400,
                                          width: 320.w,
                                          height: 70.h,
                                        ),
                                        CustomIconButton(
                                          onPressed: () {
                                            Provider.of<GlobalData>(context,
                                                    listen: false)
                                                .delete(
                                                    widget.dealslist[index]);
                                          },
                                          color: CustomColors.deleteIcon,
                                          icon: Icons.delete_outline,
                                          size: 50.sp,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: Constants.rs,
                                          color: CustomColors.textColor,
                                          textSize: 29.sp,
                                          weight: FontWeight.w700,
                                        ),
                                        SizedBox(width: 8.h),
                                        CustomText(
                                          text: (widget.dealslist[index]
                                                  .price![0].range
                                                  .toString())
                                              .toString(),
                                          color: CustomColors.textColor,
                                          textSize: 29.sp,
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 105.w, right: 8.w, top: 60.h),
                                        child: Container(
                                          height: 60.h,
                                          width: 265.w,
                                          decoration: BoxDecoration(
                                            color: CustomColors.splashScreen,
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w, right: 13.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CustomIconButton(
                                                  onPressed: () {
                                                    Provider.of<GlobalData>(
                                                            context,
                                                            listen: false)
                                                        .Decrement(widget
                                                            .dealslist[index]);
                                                  },
                                                  icon: Icons.remove,
                                                  size: 42.sp,
                                                  color: CustomColors.textColor,
                                                ),
                                                CustomText(
                                                  text: widget
                                                      .dealslist[index].counter
                                                      .toString(),
                                                  color: CustomColors.textColor,
                                                  textSize: 29.sp,
                                                  weight: FontWeight.w600,
                                                ),
                                                CustomIconButton(
                                                  onPressed: () {
                                                    Provider.of<GlobalData>(
                                                            context,
                                                            listen: false)
                                                        .Increment(widget
                                                            .dealslist[index]);
                                                  },
                                                  icon: Icons.add,
                                                  size: 44.sp,
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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 256.h,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircularSeekBar(
                          width: 75.w,
                          height: 75.h,
                          progress: progress,
                          barWidth: 6,
                          progressColor: Colors.blue,
                          outerThumbColor: CustomColors.textColor,
                        ),
                        CustomText(
                          text: Constants.dec,
                          color: CustomColors.textColor,
                          weight: FontWeight.w400,
                          textSize: 29.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomButton3(
                      bgColor: CustomColors.splashScreen,
                      height: 90.h,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Checkout(
                              dealslist:
                                  Provider.of<GlobalData>(context).getCart(),
                              price: Provider.of<GlobalData>(context)
                                  .Price()
                                  .toString(),
                            ),
                          ),
                        );
                      },
                      radius: 46.r,
                      radius1: 28.r,
                      text: Constants.proceedToCheckout,
                      text2: widget.price,
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
