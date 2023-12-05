import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      DataBaseProvider().getUserId().then((value) {
        if (value == '') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/OnboardingPage", (route) => false);
        } else {
                          DataBaseProvider().getProfileId().then((value) async {
                            if (value.isEmpty) {
                              // final isProfile =
                              //     await AuthenticationProvider().queryUserProfile();
                              // if (isProfile) {
                               Navigator.of(context)
                                    .pushNamedAndRemoveUntil("/Login", (route) => false);
                              // }

                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     "/CreatUserProfile", (route) => false);
                            } else {
                              Navigator.popAndPushNamed(context, "/App_Layout");
                            }
                          });
        }
      });
    });

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
                Color(0xff6A6A6A),
                BlendMode.modulate,
              ),
              fit: BoxFit.cover),
          gradient: const LinearGradient(
            colors: [
              Color(0xff373737),
              Color(0xff6A6A6A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 30,
            ),
            Center(
                child: Image.asset(
              'assets/images/logo-1.png',
              fit: BoxFit.cover,
              width: SizeConfig.blockSizeHorizontal! * 32,
              height: SizeConfig.blockSizeVertical! * 15,
            )
                ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 30,
            ),
            const SpinKitSpinningLines(
              duration: Duration(milliseconds: 5000),
              color: Color(0xfffE8C61E),
              itemCount: 7,
            ),
          ],
        ));
  }
}
