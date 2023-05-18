import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/search_screen.dart';
import 'package:krave_market/Screens/tabs_screen.dart';
import 'package:krave_market/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../provider/global_data_provider.dart';
import '../widgets/app_bar_general.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    Provider.of<GlobalData>(context, listen: false).readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalData>(
      builder: (BuildContext context, globalData, Widget? child) {
        return Scaffold(
          backgroundColor: CustomColors.bBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(115.h),
            child: CategoryAppBar(
              icon1: Icons.keyboard_backspace_sharp,
              icon2: Icons.search_sharp,
              text1: Constants.category,
              radius: 25.r,
              bgColor: CustomColors.splashScreen,
              onPressed: () {
                Navigator.of(context).pop();
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 55.h),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: globalData.item!.product!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.81,
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
                                    text:
                                        globalData.item!.product![index].name ??
                                            '',
                                    color: CustomColors.textColor,
                                    textSize: 27.sp,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Container(
                                  height: 172.h,
                                  width: 165.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18.r),
                                    child: Image.asset(
                                      'assets/noodles.jpg',
                                      fit: BoxFit.fill,
                                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
