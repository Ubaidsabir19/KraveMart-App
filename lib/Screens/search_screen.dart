import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/constants.dart';
import '../widgets/chip_text.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_feild.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 52.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: Constants.hint,
                controller: search,
                icon: Icons.search_rounded,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.r),
                  borderSide: BorderSide(
                    color: CustomColors.textColor,
                    width: 0.5.w,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomText(
                text: Constants.popularSearches,
                color: CustomColors.textColor,
                textSize: 35.sp,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChipText(
                    text: Constants.fruits,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.h),
                  ChipText(
                    text: Constants.vegetables,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.h),
                  ChipText(
                    text: Constants.cocomo,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.h),
                  ChipText(
                    text: Constants.milk,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChipText(
                    text: Constants.coffe,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.h),
                  ChipText(
                    text: Constants.frozenFood,
                    onPressed: () {},
                  ),
                  SizedBox(width: 12.h),
                  ChipText(
                    text: Constants.recipeMix,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
