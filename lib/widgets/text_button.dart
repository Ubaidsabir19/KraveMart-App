import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.size,
    required this.colors,
    required this.weight,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final double size;
  final Color colors;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          color: colors,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}
