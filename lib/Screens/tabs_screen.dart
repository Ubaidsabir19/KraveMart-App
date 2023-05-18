import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/search_screen.dart';
import 'package:krave_market/constants.dart';
import 'package:krave_market/widgets/custom_button_2.dart';
import 'package:krave_market/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';
import '../provider/global_data_provider.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/custom_text.dart';
import '../widgets/list_view_items.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  bool showBottomSheet = false;
  @override
  void initState() {
    Provider.of<GlobalData>(context, listen: false).readJson1();
    Provider.of<GlobalData>(context, listen: false).readJson5();
    Provider.of<GlobalData>(context, listen: false).readJson6();
    Provider.of<GlobalData>(context, listen: false).readJson4();
    Provider.of<GlobalData>(context, listen: false).readJson2();
    Provider.of<GlobalData>(context, listen: false).readJson7();
    Provider.of<GlobalData>(context, listen: false).readJson8();
    Provider.of<GlobalData>(context, listen: false).readJson9();
    Provider.of<GlobalData>(context, listen: false).readJson10();
    Provider.of<GlobalData>(context, listen: false).readJson11();
    Provider.of<GlobalData>(context, listen: false).readJson12();
    Provider.of<GlobalData>(context, listen: false).readJson13();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalData>(
      builder: (BuildContext context, globalData, Widget? child) {
        List<Tab> tabs = <Tab>[];
        for (int i = 0; i < globalData.item!.product!.length; i++) {
          tabs.add(
            Tab(
              child: CustomText(
                text: globalData.item!.product![i].name.toString(),
                color: CustomColors.textColor,
                textSize: 30.sp,
                weight: FontWeight.w600,
              ),
            ),
          );
        }
        return DefaultTabController(
          length: globalData.item!.product!.length,
          child: Scaffold(
            bottomSheet: !showBottomSheet ? null : const CustomBottomSheet(),
            backgroundColor: CustomColors.bBackground,
            appBar: AppBar(
              backgroundColor: CustomColors.splashScreen,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
              ),
              leading: CustomIconButton(
                color: CustomColors.textColor,
                icon: Icons.keyboard_backspace_sharp,
                size: 40.sp,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: Constants.category,
                    color: CustomColors.textColor,
                    textSize: 38.sp,
                    weight: FontWeight.w700,
                  ),
                  CustomIconButton(
                    color: CustomColors.textColor,
                    icon: Icons.search,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: CustomColors.textColor,
                indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 3.w, color: CustomColors.textColor),
                  insets: EdgeInsets.only(left: 20.w, right: 20.w),
                ),
                tabs: tabs,
              ), // TabBar
            ), // AppBar
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: CustomButton(
                            text: Constants.hotDeals,
                            onPressed: () {},
                            radius: 40.r,
                            width: 215.w,
                            height: 71.h,
                            size: 30.sp,
                            color: CustomColors.textColor,
                            bgColor: CustomColors.splashScreen,
                            weight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items!.deal[index],
                              name:
                                  globalData.items!.deal[index].name.toString(),
                              price: globalData
                                  .items!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: CustomButton(
                            text: Constants.payday,
                            onPressed: () {},
                            radius: 40.r,
                            width: 215.w,
                            height: 71.h,
                            size: 30.sp,
                            weight: FontWeight.w500,
                            color: CustomColors.textColor,
                            bgColor: CustomColors.splashScreen,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items4!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items4!.deal[index],
                              name: globalData.items4!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items4!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items4!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items4!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items4!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items4!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.biscuitsWafers,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 310.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.chipsNimko,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 275.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.popcorn,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 215.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.cakes,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 195.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.crackers,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 205.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items5!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items5!.deal[index],
                              name: globalData.items5!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items5!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items5!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items5!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items5!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items5!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.fruits,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 195.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.vegetables,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 260.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.frozen,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 305.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items3!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items3!.deal[index],
                              name: globalData.items3!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items3!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items3!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items3!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items3!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items3!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.breadBuns,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 270.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.eggs,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 200.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.breakfast,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 305.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.butter,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 335.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.paratha,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 305.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.jams,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 355.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.spread,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 200.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.rusk,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 195.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.honey,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 300.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items1!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items1!.deal[index],
                              name: globalData.items1!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items1!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items1!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items1!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items1!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items1!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.spices,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 205.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.recipeMixes,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 270.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.salt,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 170.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items6!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items6!.deal[index],
                              name: globalData.items6!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items6!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items6!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items6!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items6!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items6!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.washingPowder,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 320.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.fabric,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 470.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items7!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items7!.deal[index],
                              name: globalData.items7!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items7!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items7!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items7!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items7!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items7!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.cookingOil,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 260.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.ghee,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 320.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.oliveOil,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 230.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items8!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items8!.deal[index],
                              name: globalData.items8!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items8!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items8!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items8!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items8!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items8!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.handfree,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 440.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.neckBands,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 250.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.chargers,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 230.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.dataCables,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 260.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.keyboardsMouse,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 360.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.powerBanks,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 270.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.smartWatches,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 295.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.otherAccessories,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 330.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items9!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items9!.deal[index],
                              name: globalData.items9!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items9!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items9!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items9!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items9!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items9!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.milkMilkPowders,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 380.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.flavouredMilk,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 300.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.plainFlavouredYogurt,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 430.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.cheeseCream,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 300.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items10!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items10!.deal[index],
                              name: globalData.items10!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items10!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items10!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items10!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items10!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items10!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.shavingHairRemove,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 420.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.creamsMoisturizers,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 420.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.menDeodorants,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 330.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.hairColorTreatment,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 420.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.hairOil,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 230.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.womenDeodorants,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 370.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.shoeShinePolish,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 370.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.groomingKits,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 300.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.faceMasks,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 280.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.hairStyling,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 270.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items11!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items11!.deal[index],
                              name: globalData.items11!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items11!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items11!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items11!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items11!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items11!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, bottom: 20.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomButton(
                                  text: Constants.blackTea,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 240.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.teaWhitener,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 280.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.greenTea,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 240.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.coffee,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 200.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                                CustomButton(
                                  text: Constants.sweeteners,
                                  onPressed: () {},
                                  radius: 40.r,
                                  width: 250.w,
                                  height: 71.h,
                                  size: 30.sp,
                                  weight: FontWeight.w400,
                                  color: CustomColors.textColor,
                                  bgColor: CustomColors.splashScreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: globalData.items12!.deal.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListviewItems(
                              deal: globalData.items12!.deal[index],
                              name: globalData.items12!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items12!.deal[index].price![0].range
                                  .toString(),
                              Increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items12!.deal[index]);
                              },
                              Decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items12!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items12!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items12!.deal[index],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
