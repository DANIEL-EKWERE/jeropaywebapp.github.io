import 'package:databank/customizations/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10))
        .then((value) => Navigator.popAndPushNamed(context, "/App_Layout"));
    SizeConfig().init(context);
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                'assets/images/splash (1).png',
              ),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.modulate,
              ),
              fit: BoxFit.cover),
          gradient: const LinearGradient(
            colors: [
              Color(0xff6A6A6A),
              Color(0xff393939),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            // 'assets/images/splash (1).png',
            // fit: BoxFit.cover,
            //         ),
            Center(
              child: SvgPicture.asset('assets/images/data bank logo.svg'),
            )
          ],
        ));
  }
}
