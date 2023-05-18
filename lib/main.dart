import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krave_market/provider/global_data_provider.dart';
import 'package:krave_market/widgets/bottom_sheet_widget.dart';
import 'package:provider/provider.dart';
import 'Screens/splash_screen.dart';
import 'constants.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return GlobalData();
          },
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(720, 1520),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.title,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
