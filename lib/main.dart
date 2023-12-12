// import 'dart:js';

import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/backend/provider/transaction_provider/transactions_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/handle_exceptions.dart';
import 'package:databank/views/app_layout.dart';
import 'package:databank/views/create_profile.dart';
import 'package:databank/views/log_in.dart';
import 'package:databank/views/onboarding_page.dart';
import 'package:databank/views/password_reset.dart';
import 'package:databank/views/register.dart';
import 'package:databank/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'backend/provider/database/db_provider.dart';
import 'backend/provider/purchase_provider/purchases_provider.dart';
import 'backend/provider/user_details/user_details.dart';
import 'views/electric_bill_expanded.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  try {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => DataBaseProvider()),
        ChangeNotifierProvider(create: (context) => PurchaseProvider()),
        ChangeNotifierProvider(create: (context) => UserDetails()),
        ChangeNotifierProvider(create: (context) => TransactionsProvider()),
      ],
      child: MaterialApp(
        title: 'Data Bank',
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
          "/Register": (context) => const Register(),
          "/ElectricExpanded": (context) => const ElectricExpanded(),
          "/PasswordReset": (context) => const PasswordReset(),
          "/CreatUserProfile": (context) => const CreatUserProfile(),
          "/OnboardingPage": (context) => const OnboardingPage(),
        },
      ),
    ));
  } catch (e, stackTrace) {
    handleException(e, stackTrace);
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {


//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
