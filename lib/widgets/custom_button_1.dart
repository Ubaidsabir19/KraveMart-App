import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CustomButton1 extends StatelessWidget {
  final Function onPressed;
  final String? text1;
  final String text2;
  final String text3;
  final double? size;
  final Color? color;
  final Color? bgColor;
  final FontWeight? weight;
  final double? height;
  final double? width;
  final double radius;
  final double? radius1;

  const CustomButton1({
    Key? key,
    this.text1,
    required this.onPressed,
    this.size,
    this.color,
    this.bgColor,
    this.weight,
    this.height,
    this.width,
    required this.radius,
    this.radius1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        elevation: 0.05,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.only(left: 22.w, right: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: radius1,
                  backgroundColor: CustomColors.bBackground,
                  child: Center(
                    child: Text(
                      text1!,
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: size,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    text2,
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      Constants.rs,
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      text3,
                      style: TextStyle(
                        color: CustomColors.textColor,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
