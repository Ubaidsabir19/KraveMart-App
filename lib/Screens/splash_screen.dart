import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_text.dart';
import 'location_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LocationScreen()));
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.splashScreen,
      body: SafeArea(
        child: Center(
          child: CustomText(
            text: Constants.k,
            color: CustomColors.textColor,
            textSize: 250.sp,
            weight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
