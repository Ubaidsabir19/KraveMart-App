import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipText extends StatelessWidget {
  const ChipText({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 100.h,
        alignment: Alignment.topCenter,
        child: Chip(
          label: Text(text),
        ),
      ),
    );
  }
}
