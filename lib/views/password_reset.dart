// import 'package:flutter/gestures.dart';
import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/snackbar.dart';
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
                  Transform.scale(
                    scale: 0.5,
                    child: Image.asset(
                                  'assets/images/logo-1.png',
                                  fit: BoxFit.cover,
                                  width: SizeConfig.blockSizeHorizontal! * 35,
                                  height: SizeConfig.blockSizeVertical! * 30,
                                ),
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
                  Consumer<AuthenticationProvider>(
                    builder: (context, value, child) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (value.reqMessage != '') {
                          successMessage(
                              message: value.reqMessage,
                              x: value.color,
                              context: context);

                          value.clear();
                        }
                      });
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [
                                     purple,purple
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (_userNameController!.text.isEmpty ||
                                  //     _passwordController!.text.isEmpty) {
                                  //   warning(
                                  //       message: 'fields cant\'t be empty',
                                  //       context: context);
                                  //   } else {
                                  // value.loginUser(
                                  //     username:
                                  //         _userNameController!.text.trim(),
                                  //     password:
                                  //         _passwordController!.text.trim(),
                                  //     context: context);
                                  //  }
                                  // () async {
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    foregroundColor: kWhite,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: value.isLoading
                                    ? const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Loading please wait...',
                                            style: TextStyle(color: kWhite),
                                          )
                                        ],
                                      )
                                    : Text(
                                        'Log In',
                                        style: TextStyle(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.5,
                                            color: kWhite),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
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
