import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final InputBorder? border;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.aBackground,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Center(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          autocorrect: true,
          controller: controller,
          decoration: InputDecoration(
            border: border,
            hintText: hintText,
            hintStyle:
                TextStyle(color: CustomColors.hintColor, fontSize: 30.sp),
            prefixIcon: Image.asset(
              'assets/search.png',
              color: CustomColors.textColor,
              height: 16.h,
              width: 16.w,
            ),
          ),
        ),
      ),
    );
  }
}
