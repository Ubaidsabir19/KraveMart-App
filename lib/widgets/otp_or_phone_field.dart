import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class SingleTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData? icon;
  final InputBorder? border;
  final double width;
  final double height;

  const SingleTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.border,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
  bool isTextFiledFocus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      constraints: BoxConstraints(
          minHeight: 30.h, minWidth: 25.w, maxHeight: 40.h, maxWidth: 100.w),
      child: Focus(
        child: TextFormField(
          textInputAction: TextInputAction.next,
          autofocus: true,
          maxLength: 1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor, width: 4.w),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColors.textColor, width: 4.w),
            ),
          ),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.bottom,
          controller: widget.controller,
        ),
        onFocusChange: (hasFocus) {
          setState(() {
            isTextFiledFocus = hasFocus;
          });
        },
      ),
    );
  }
}
