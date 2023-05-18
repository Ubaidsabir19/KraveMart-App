import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/constants.dart';

import 'Payment_Bottom_sheet.dart';
import 'location_selection_sheet.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    this.bgColor,
    this.imageIcon,
    required this.onPressed,
    this.text1,
    this.textColor,
    this.size,
    this.text2,
    this.radius,
    this.text3,
    this.text4,
    required this.onTap,
  }) : super(key: key);
  final Color? bgColor;
  final ImageIcon? imageIcon;
  final double? size;
  final Function onPressed;
  final String? text1;
  final String? text3;
  final String? text2;
  final String? text4;
  final Color? textColor;
  final double? radius;
  final Function onTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.bgColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32.r),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            widget.onPressed();
          },
          icon: Image.asset(
            'assets/list.png',
            height: 35.h,
            width: 35.w,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text4 ?? Constants.yl,
                    style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.text1 ?? '',
                    style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  widget.text3 ?? Constants.deliverIn,
                  style: TextStyle(
                      color: CustomColors.textColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.text2 ?? '',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w700,
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
