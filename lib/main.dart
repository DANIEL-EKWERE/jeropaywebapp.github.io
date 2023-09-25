import 'package:databank/customizations/app_style.dart';
import 'package:databank/views/app_layout.dart';
import 'package:databank/views/log_in.dart';
import 'package:databank/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/electric_bill_expanded.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //  openDrawer();
  }

  late double xOffset;

  late double yOffset;

  late double scaleFactor = 0.6;
//  late VoidCallback openDrawer;
  // void openDrawer() => setState(() {
  //       xOffset = 230;
  //       yOffset = 150;
  //       scaleFactor = 0.6;
  //     });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(backgroundColor: kWhite),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      routes: {
        "/": (context) => const SplashScreen(),
        "/Login": (context) => const LoginScreen(),
        //  "/Home": (context) => const HomeScreen(),
        //  "/Cart": (context) => const HistoryScreen(),
        //  "/Profile": (context) => const ProfileScreen(),
        //  "/Favorites": (context) => const RewardScreen(),
        "/App_Layout": (context) => const AppLayout(),
        "/ElectricExpanded": (context) => const ElectricExpanded(),
      },
    );
  }
}
