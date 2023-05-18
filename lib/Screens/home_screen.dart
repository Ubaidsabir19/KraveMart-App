import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/categories_screen.dart';
import 'package:krave_market/Screens/search_screen.dart';
import 'package:krave_market/Screens/tabs_screen.dart';
import 'package:krave_market/widgets/location_selection_sheet.dart';
import 'package:krave_market/widgets/search_button.dart';
import 'package:krave_market/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/global_data_provider.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/custom_button_2.dart';
import '../widgets/grid_view_items.dart';
import '../widgets/home_screen_appBar.dart';
import '../widgets/login_bottom_sheet.dart';
import '../widgets/navigation_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late int currentIndex;
  bool showBottomSheet = false;
  bool showSheet = false;
  bool showSheetBottomModel = false;

  @override
  void initState() {
    Provider.of<GlobalData>(context, listen: false).readJson();
    Provider.of<GlobalData>(context, listen: false).readJson1();
    Provider.of<GlobalData>(context, listen: false).readJson2();
    Provider.of<GlobalData>(context, listen: false).readJson3();
    Provider.of<GlobalData>(context, listen: false).readJson4();
    super.initState();
  }

  double progress = 70;

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalData>(
      builder: (BuildContext context, globalData, Widget? child) {
        return Scaffold(
          key: _key,
          bottomSheet: (!showBottomSheet && !showSheet && !showSheetBottomModel)
              ? null
              : showSheet
                  ? LoginBottomSheet()
                  : showSheetBottomModel
                      ? LocationSelectionSheet()
                      : CustomBottomSheet(),
          backgroundColor: CustomColors.bBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(118.h),
            child: CustomAppBar(
              text1: Constants.society,
              text2: Constants.mints,
              bgColor: CustomColors.splashScreen,
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              onTap: () {
                setState(() {
                  showSheetBottomModel = true;
                });
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 22.w, top: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: SearchButton(
                        height: 84.h,
                        width: double.infinity,
                        bgColor: CustomColors.aBackground,
                        text: Constants.searchAnything,
                        size: 28.sp,
                        color: CustomColors.hintColor,
                        radius: 40.r,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(right: 19.w, left: 8.w),
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          child: SizedBox(
                            height: 300.h,
                            width: 800.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(
                                'assets/adds.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          height: 420.h,
                          aspectRatio: 2,
                          viewportFraction: 0.99,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 700),
                          autoPlayCurve: Curves.easeIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(height: 42.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: Constants.category,
                            color: CustomColors.textColor,
                            textSize: 37.sp,
                            weight: FontWeight.w700,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoriesScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                CustomText(
                                  text: Constants.viewAll,
                                  textSize: 29.sp,
                                  color: CustomColors.textButtonColor,
                                  weight: FontWeight.w500,
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 38.sp,
                                  color: CustomColors.textButtonColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 38.h),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: globalData.item!.product!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1.8,
                          crossAxisSpacing: 1.8,
                          childAspectRatio: 0.79,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TabScreen(),
                                ),
                              );
                            },
                            child: GridTile(
                              child: Card(
                                elevation: 0,
                                color: CustomColors.aBackground,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CustomText(
                                        text: globalData
                                                .item!.product![index].name ??
                                            '',
                                        color: CustomColors.textColor,
                                        textSize: 30.sp,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    SizedBox(
                                      height: 182.h,
                                      width: 162.h,
                                      child: Image.asset(
                                        'assets/noodles.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.topPicks,
                        color: CustomColors.textColor,
                        textSize: 37.sp,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      height: 399.h,
                      width: double.infinity,
                      color: CustomColors.bBackground,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 0.5,
                          crossAxisSpacing: 0.5,
                          childAspectRatio: 1.36,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridTile(
                            child: Card(
                              elevation: 0.5,
                              color: CustomColors.aBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/add.jpg',
                                  fit: BoxFit.fill,
                                  //color: CustomColors.textColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.hotDeals,
                        color: CustomColors.textColor,
                        textSize: 37.sp,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Container(
                      height: 448.h,
                      width: double.infinity,
                      color: CustomColors.bBackground,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: globalData.items!.deal.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 0.1,
                                crossAxisSpacing: 0.2,
                                childAspectRatio: 1.38),
                        itemBuilder: (BuildContext context, int index) {
                          return GridViewProducts(
                              deal: globalData.items!.deal[index],
                              name:
                                  globalData.items!.deal[index].name.toString(),
                              price: globalData
                                  .items!.deal[index].price![0].range
                                  .toString(),
                              increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items!.deal[index]);
                              },
                              decrement: () {
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
                              ]);
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.fruits,
                        color: CustomColors.textColor,
                        textSize: 37.sp,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Container(
                      height: 448.h,
                      width: double.infinity,
                      color: CustomColors.bBackground,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: globalData.items2!.deal.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 0.2,
                          crossAxisSpacing: 0.2,
                          childAspectRatio: 1.38,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridViewProducts(
                              deal: globalData.items2!.deal[index],
                              name: globalData.items2!.deal[index].name
                                  .toString(),
                              price: globalData
                                  .items2!.deal[index].price![0].range
                                  .toString(),
                              increment: () {
                                showBottomSheet = true;
                                Provider.of<GlobalData>(context, listen: false)
                                    .Increment(globalData.items2!.deal[index]);
                              },
                              decrement: () {
                                Provider.of<GlobalData>(context, listen: false)
                                    .Decrement(globalData.items2!.deal[index]);
                                if (Provider.of<GlobalData>(context,
                                            listen: false)
                                        .totalItems() ==
                                    0) {
                                  showBottomSheet = false;
                                }
                              },
                              counting: Provider.of<GlobalData>(context)
                                  .DealCounter(globalData.items2!.deal[index])
                                  .toString(),
                              dealslist: [
                                globalData.items2!.deal[index],
                              ]);
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.vegetables,
                        color: CustomColors.textColor,
                        textSize: 37.sp,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Container(
                      height: 448.h,
                      width: double.infinity,
                      color: CustomColors.bBackground,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: globalData.items3!.deal.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 0.2,
                          crossAxisSpacing: 0.2,
                          childAspectRatio: 1.38,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridViewProducts(
                            deal: globalData.items3!.deal[index],
                            name:
                                globalData.items3!.deal[index].name.toString(),
                            price: globalData
                                .items3!.deal[index].price![0].range
                                .toString(),
                            increment: () {
                              showBottomSheet = true;
                              Provider.of<GlobalData>(context, listen: false)
                                  .Increment(globalData.items3!.deal[index]);
                            },
                            decrement: () {
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
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.breakfast,
                        color: CustomColors.textColor,
                        textSize: 37.sp,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Container(
                      height: 448.h,
                      width: double.infinity,
                      color: CustomColors.bBackground,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: globalData.items1!.deal.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 0.2,
                          crossAxisSpacing: 0.2,
                          childAspectRatio: 1.38,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridViewProducts(
                            deal: globalData.items1!.deal[index],
                            name:
                                globalData.items1!.deal[index].name.toString(),
                            price: globalData
                                .items1!.deal[index].price![0].range
                                .toString(),
                            increment: () {
                              showBottomSheet = true;
                              Provider.of<GlobalData>(context, listen: false)
                                  .Increment(globalData.items1!.deal[index]);
                            },
                            decrement: () {
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
                    ),
                    SizedBox(height: 38.h),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: CustomText(
                        text: Constants.findProduct,
                        color: CustomColors.textColor,
                        textSize: 65.sp,
                        weight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 45.h),
                    CustomButton(
                      text: Constants.browse,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoriesScreen(),
                          ),
                        );
                      },
                      size: 30.sp,
                      radius: 40.r,
                      height: 75.h,
                      width: 310.w,
                      bgColor: CustomColors.splashScreen,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ),
          drawer: NavDrawer(
            onPressed: () {
              setState(() {
                showSheet = true;
              });
            },
          ),
        );
      },
    );
  }
}
