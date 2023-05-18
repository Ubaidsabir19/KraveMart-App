import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CustomTextField2 extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final InputBorder? border;
  final double width;

  const CustomTextField2({
    Key? key,
    required this.hintText,
    required this.controller,
    this.border,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: width,
      decoration: BoxDecoration(
        color: CustomColors.aBackground,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Center(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          autocorrect: true,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 35.w),
            border: border,
            hintText: hintText,
            hintStyle:
                TextStyle(color: CustomColors.hintColor, fontSize: 30.sp),
          ),
        ),
      ),
    );
  }
}
