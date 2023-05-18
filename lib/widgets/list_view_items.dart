import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/global_data_provider.dart';
import '../services/deal.dart';
import 'custom_icon_button.dart';
import 'custom_text.dart';

class ListviewItems extends StatefulWidget {
  const ListviewItems({
    Key? key,
    this.deal,
    required this.name,
    required this.price,
    required this.Increment,
    required this.Decrement,
    required this.counting,
    required this.dealslist,
  }) : super(key: key);

  final Deal? deal;
  final String name;
  final String price;
  final Function Increment;
  final Function Decrement;
  final String counting;
  final List dealslist;

  @override
  State<ListviewItems> createState() => _ListviewItemsState();
}

class _ListviewItemsState extends State<ListviewItems> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 8.h, top: 8.h),
      child: Card(
        elevation: 0.02,
        color: CustomColors.aBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55.r),
        ),
        child: Container(
          height: 294.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 18.w, right: 15.w, bottom: 1.h),
            child: Row(
              children: [
                Center(
                  child: Container(
                    height: 220.h,
                    width: 182.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.asset(
                        'assets/noodles.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 80.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.name,
                        color: CustomColors.textColor,
                        textSize: 28.sp,
                        weight: FontWeight.w300,
                      ),
                      SizedBox(height: 19.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            text: Constants.rs,
                            color: CustomColors.textColor,
                            textSize: 29.sp,
                            weight: FontWeight.w800,
                          ),
                          SizedBox(width: 8.h),
                          CustomText(
                            text: widget.price,
                            color: CustomColors.textColor,
                            textSize: 29.sp,
                            weight: FontWeight.w800,
                          ),
                        ],
                      ),
                      !value
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 290.w, top: 68.h),
                                child: GestureDetector(
                                  onTap: () {
                                    widget.Increment();
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
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 105.w, right: 2.w, top: 75.h),
                                child: Container(
                                  height: 58.h,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                    color: CustomColors.splashScreen,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w, right: 12.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomIconButton(
                                          onPressed: () {
                                            if (Provider.of<GlobalData>(context,
                                                            listen: false)
                                                        .counter ==
                                                    1 ||
                                                Provider.of<GlobalData>(context,
                                                            listen: false)
                                                        .counter ==
                                                    0) {
                                              value = false;
                                            }
                                            if (widget.dealslist != null) {
                                              widget.Decrement();
                                            }
                                          },
                                          icon: Icons.remove,
                                          size: 46.sp,
                                          color: CustomColors.textColor,
                                        ),
                                        CustomText(
                                          text: widget.counting,
                                          color: CustomColors.textColor,
                                          textSize: 29.sp,
                                          weight: FontWeight.w800,
                                        ),
                                        CustomIconButton(
                                          onPressed: () {
                                            widget.Increment();
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
