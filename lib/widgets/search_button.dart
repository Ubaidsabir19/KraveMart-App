import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class SearchButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double? size;
  final Color? color;
  final Color? bgColor;
  final FontWeight? weight;
  final double? height;
  final double? width;
  final double radius;
  final ImageIcon? icon;

  const SearchButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size,
    this.color,
    this.bgColor,
    this.weight,
    this.height,
    this.width,
    required this.radius,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        elevation: 0,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.only(left: 28.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/search.png',
                  color: CustomColors.hintColor,
                  height: 32.h,
                  width: 32.w,
                ),
                SizedBox(width: 19.w),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: size,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
