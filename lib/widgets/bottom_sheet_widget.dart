import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Screens/cart_screen.dart';
import '../constants.dart';
import '../provider/global_data_provider.dart';
import 'custom_button_1.dart';
import 'custom_text.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double progress = 70;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 0,
      backgroundColor: CustomColors.aBackground,
      enableDrag: false,
      onClosing: () {
        Navigator.pop(context);
      },
      builder: (BuildContext ctx) => Container(
        height: 255.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularSeekBar(
                    width: 75.w,
                    height: 75.h,
                    progress: progress,
                    barWidth: 6,
                    progressColor: Colors.blue,
                    outerThumbColor: CustomColors.textColor,
                  ),
                  CustomText(
                    text: Constants.dec,
                    color: CustomColors.textColor,
                    weight: FontWeight.w400,
                    textSize: 29.sp,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomButton1(
                bgColor: CustomColors.splashScreen,
                height: 90.h,
                width: double.infinity,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        dealslist: Provider.of<GlobalData>(context).getCart(),
                        price:
                            Provider.of<GlobalData>(context).Price().toString(),
                        items: Provider.of<GlobalData>(context)
                            .totalItems()
                            .toString(),
                      ),
                    ),
                  );
                },
                radius: 46.r,
                radius1: 28.r,
                text2: Constants.viewCart,
                text1: Provider.of<GlobalData>(context).totalItems().toString(),
                text3: Provider.of<GlobalData>(context).Price().toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
