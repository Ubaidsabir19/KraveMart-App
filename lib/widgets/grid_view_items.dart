import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/global_data_provider.dart';
import '../services/deal.dart';
import 'custom_icon_button.dart';
import 'custom_text.dart';

class GridViewProducts extends StatefulWidget {
  GridViewProducts({
    Key? key,
    this.deal,
    required this.name,
    required this.price,
    required this.increment,
    required this.decrement,
    required this.counting,
    required this.dealslist,
  }) : super(key: key);

  final Deal? deal;
  final String name;
  final String price;
  final Function increment;
  final Function decrement;
  final String counting;
  final List dealslist;

  @override
  State<GridViewProducts> createState() => _GridViewProductsState();
}

class _GridViewProductsState extends State<GridViewProducts> {
  bool value = false;
//with TickerProviderStateMixin
  //{
  // AnimationController? _controller;
  // Animation<double>? _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     duration: const Duration(seconds: 1),
  //     vsync: this,
  //   );
  //   _animation = CurvedAnimation(
  //     parent: _controller!,
  //     curve: Curves.easeInToLinear,
  //   );
  // }

  // _toggleRow() {
  //   print(_animation!.status);
  //   if (_animation!.status != AnimationStatus.completed) {
  //     _controller!.forward();
  //   } else {
  //     _controller!.animateBack(0, duration: const Duration(seconds: 1));
  //   }
  // }

  //bool _showBottomSheet = true;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        elevation: 0,
        color: CustomColors.aBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200.h,
                  width: 230.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Image.asset(
                      'assets/noodles.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 20.w),
                child: CustomText(
                  text: widget.name,
                  color: CustomColors.textColor,
                  textSize: 25.sp,
                  weight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 20.w),
                child: Row(
                  children: [
                    CustomText(
                      text: Constants.rs,
                      color: CustomColors.textColor,
                      textSize: 29.sp,
                      weight: FontWeight.w800,
                    ),
                    SizedBox(width: 12.w),
                    CustomText(
                      text: widget.price,
                      color: CustomColors.textColor,
                      textSize: 29.sp,
                      weight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              !value
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 22.h),
                        child: GestureDetector(
                          onTap: () {
                            widget.increment();
                            setState(() {
                              value = true;
                            });
                          },
                          child: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: CustomColors.splashScreen,
                            child: const Icon(Icons.add,
                                color: CustomColors.textColor),
                          ),
                        ),
                      ))
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 3.w, right: 3.w, top: 22.h),
                        child: Container(
                          height: 59.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColors.splashScreen,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 19.w, right: 19.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                  onPressed: () {
                                    if (Provider.of<GlobalData>(context,
                                                listen: false)
                                            .totalItems() ==
                                        1) {
                                      value = false;
                                    }
                                    if (widget.dealslist != null) {
                                      widget.decrement();
                                    }
                                  },
                                  icon: Icons.remove,
                                  size: 46.sp,
                                  color: CustomColors.textColor,
                                ),
                                CustomText(
                                  text: widget.counting,
                                  color: CustomColors.textColor,
                                  textSize: 30.sp,
                                  weight: FontWeight.w800,
                                ),
                                CustomIconButton(
                                  onPressed: () {
                                    widget.increment();
                                  },
                                  icon: Icons.add,
                                  size: 48.sp,
                                  color: CustomColors.textColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
