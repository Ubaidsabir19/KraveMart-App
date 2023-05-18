import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.color,
    required this.textSize,
    required this.weight,
    this.height,
    this.width,
  }) : super(key: key);
  final String text;
  final Color color;
  final dynamic textSize;
  final FontWeight weight;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Text(
        text,
        maxLines: 2,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: textSize,
          fontWeight: weight,
        ),
      ),
    );
  }
}
