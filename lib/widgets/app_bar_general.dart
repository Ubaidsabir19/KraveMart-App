import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_icon_button.dart';
import 'custom_text.dart';

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({
    Key? key,
    this.bgColor,
    this.size,
    required this.onPressed,
    this.text1,
    this.textColor,
    this.radius,
    this.icon1,
    this.icon2,
    required this.onTap,
  }) : super(key: key);

  final Color? bgColor;
  final double? size;
  final Function onPressed;
  final Function onTap;
  final String? text1;
  final Color? textColor;
  final IconData? icon1;
  final IconData? icon2;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(radius!),
          ),
        ),
        leading: CustomIconButton(
          onPressed: () {
            onPressed();
          },
          icon: icon1,
          color: CustomColors.textColor,
          size: 40.sp,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: text1 ?? '',
              color: CustomColors.textColor,
              textSize: 34.sp,
              weight: FontWeight.w500,
            ),
            CustomIconButton(
              onPressed: () {
                onTap();
              },
              color: CustomColors.textColor,
              icon: icon2,
              size: 45.sp,
            )
          ],
        ),
      ),
    );
  }
}
