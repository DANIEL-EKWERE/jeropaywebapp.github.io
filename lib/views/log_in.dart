// import 'package:cool_alert/cool_alert.dart';
import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/views/date_range.dart';
import 'package:databank/views/password_reset.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
// import '../firebase_options.dart';
import '../widget/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  final TextEditingController? _userNameController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  bool _usernameInputIsValid = true;
  final RegExp usernameExp = RegExp(r'^[a-zA-Z0-9*\-_@/\\]+$');
  @override
  void dispose() {
    super.dispose();
    _userNameController!.dispose();
    _passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Sign In',
                    style: kEncodeSansBold.copyWith(
                        color: kBlack,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  ),
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
                      'Welcome Back!',
                      style: kEncodeSansBold.copyWith(
                          color: kBlack,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign in your account to continue',
                      style: kEncodeSansMedium.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.person)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter User Name',
                      label: Text(
                        'Enter User Name',
                        style: kEncodeSansSemiBold.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                      ),
                      errorText: _usernameInputIsValid
                          ? null
                          : 'Enter alphanumeric and special character(e.g */\\_-) etc!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _usernameInputIsValid = false;
                        });
                      } else if (!usernameExp.hasMatch(value)) {
                        setState(() {
                          _usernameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _usernameInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconTheme(
                        data: const IconThemeData(color: kDarkGrey),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: _passwordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.security)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter Password',
                      label: Text(
                        'Enter Password',
                        style: kEncodeSansSemiBold.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                      ),
                      //errorText: 'please enter the meter type!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      fillColor: kLightGrey,
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 1,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: ((context) => const PasswordReset())));

                        // const PasswordReset())));
                      },
                      child: Text(
                        'Forget Password?',
                        style: kEncodeSansMedium.copyWith(
                          color: kBlack,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Consumer<AuthenticationProvider>(
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
                                        Color(0xff373737),
                                        Color(0xff6A6A6A),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_userNameController!.text.isEmpty ||
                                        _passwordController!.text.isEmpty) {
                                      warning(
                                          message: 'fields cant\'t be empty',
                                          context: context);
                                    } else {
                                      value.loginUser(
                                          username:
                                              _userNameController!.text.trim(),
                                          password:
                                              _passwordController!.text.trim(),
                                          context: context);
                                    }
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
                    //
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  Text.rich(TextSpan(
                      text: "Don\'t have an account? ",
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.2),
                      children: [
                        TextSpan(
                            text: 'Register',
                            style: kEncodeSansBold.copyWith(
                                color: kBlack,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 2.2),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/Register", (route) => false);
                              })
                      ])),
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
