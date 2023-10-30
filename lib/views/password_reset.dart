// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/button.dart';
import '../widget/textField.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({
    super.key,
  });

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: kEncodeSansBold.copyWith(
              color: kBlack, fontSize: SizeConfig.blockSizeHorizontal! * 3),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: sizeHorizontal * 5,
                  ),
                  SvgPicture.asset('assets/images/logo-1.svg'),
                  SizedBox(
                    height: sizeHorizontal * 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your email!',
                      style: kEncodeSansBold.copyWith(
                          color: kBlack,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter the email you used in registering an account with us',
                      style: kEncodeSansMedium.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  textFieldEmail(
                      'Enter Email', 'Enter Email', _emailController),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'If the email provided is in our database, you\'ll receive an instruction on how to reset your password soon!!!',
                      style: kEncodeSansMedium.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  button('Proceed'),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  SizedBox(
                    height: sizeHorizontal * 13,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
