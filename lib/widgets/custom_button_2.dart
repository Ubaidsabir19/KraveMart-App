import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double? size;
  final Color? color;
  final Color? bgColor;
  final FontWeight weight;
  final double? height;
  final double? width;
  final double radius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size,
    this.color,
    this.bgColor,
    required this.weight,
    this.height,
    this.width,
    required this.radius,
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
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: weight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
