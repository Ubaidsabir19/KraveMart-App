import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/Screens/Edit_Profile.dart';
import 'package:krave_market/Screens/order_screen.dart';
import 'package:krave_market/Screens/payment_screen.dart';
import 'package:krave_market/Screens/voucher_screen.dart';
import 'package:krave_market/Screens/wallet_screen.dart';
import 'package:krave_market/widgets/custom_icon_button.dart';
import 'package:krave_market/widgets/custom_text.dart';
import '../Screens/address_screen.dart';
import '../constants.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key, required this.onPressed});

  final Function onPressed;

  TextEditingController phoneController = TextEditingController();

  TextEditingController oTPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 230.h,
            child: DrawerHeader(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/kravemart.png',
                            height: 80.h,
                            color: CustomColors.textColor,
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text: Constants.version,
                            color: CustomColors.hintColor,
                            textSize: 24.sp,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: CustomColors.textColor,
                      icon: Icons.close,
                      size: 49.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(Constants.login),
            leading: IconButton(
              icon: const Icon(
                Icons.person,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onPressed();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              onPressed();
            },
          ),
          ListTile(
            title: const Text(Constants.profile),
            leading: IconButton(
              icon: const Icon(
                Icons.person_outline,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfile()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
          ListTile(
            title: const Text(Constants.orders),
            leading: IconButton(
              icon: const Icon(
                Icons.list,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrderScreen()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrderScreen()));
            },
          ),
          ListTile(
            title: const Text(Constants.address),
            leading: IconButton(
              icon: const Icon(
                Icons.location_on_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddressScreen()));
            },
          ),
          ListTile(
            title: const Text(Constants.wallet),
            leading: IconButton(
              icon: const Icon(
                Icons.book_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WalletScreen()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WalletScreen()));
            },
          ),
          ListTile(
            title: const Text(Constants.voucher),
            leading: IconButton(
              icon: const Icon(
                Icons.vertical_shades_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VoucherScreen()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VoucherScreen()));
            },
          ),
          ListTile(
            title: const Text(Constants.payment),
            leading: IconButton(
              icon: const Icon(
                Icons.wallet_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentScreen()));
            },
          ),
          Divider(color: Colors.grey, height: 2.h),
          ListTile(
            title: const Text(Constants.helpCenter),
            leading: IconButton(
              icon: const Icon(
                Icons.question_mark_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text(Constants.termsConditions),
            leading: IconButton(
              icon: const Icon(
                Icons.library_books_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text(Constants.privacyPolicy),
            leading: IconButton(
              icon: const Icon(
                Icons.privacy_tip_outlined,
                color: CustomColors.textColor,
              ),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text(Constants.logout),
            leading: IconButton(
              icon: const Icon(
                Icons.logout,
                color: CustomColors.textColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
