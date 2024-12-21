import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/customizations/app_style.dart';
// import 'package:databank/widget/textField.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../customizations/size_config.dart';
// import '../widget/button.dart';
import '../widget/snackbar.dart';
// import '../firebase_options.dart';
// import 'dart:developer' as devtools;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
  final RegExp usernameExp = RegExp(r'^[a-zA-Z0-9*\-_@/\\]+$');
  bool _firstNameInputIsValid = true;
  bool _lastNameInputIsValid = true;
  bool _usernameInputIsValid = true;
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  // bool _numberInputIsValid = true;
  bool _isCheck = false;
  bool isLoading = false;
  final TextEditingController? _firstNameController = TextEditingController();
  final TextEditingController? _lastNameController = TextEditingController();
  final TextEditingController? _userNameController = TextEditingController();
  final TextEditingController? _phoneController = TextEditingController();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _confirmPasswordController =
      TextEditingController();

  // final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    _confirmPasswordController!.dispose();
    _userNameController!.dispose();
    _phoneController!.dispose();
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
                    'Register',
                    style: kEncodeSansBold.copyWith(
                        color: kBlack,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 4,
                  ),
                  Image.asset(
              'assets/images/logo-1.png',
              fit: BoxFit.cover,
              width: SizeConfig.blockSizeHorizontal! * 27,
              height: SizeConfig.blockSizeVertical! * 10,
            ),
                  SizedBox(
                    height: sizeHorizontal * 4,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello!',
                      style: kEncodeSansBold.copyWith(
                          color: kBlack,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Register an account with us',
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
                    height: sizeHorizontal * 3.5,
                  ),
                  TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.person)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter First Name',
                      label: Text(
                        'Enter First Name',
                        style: kEncodeSansSemiBold.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                      ),
                      errorText: _firstNameInputIsValid
                          ? null
                          : 'please enter only alphabetical characters only!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _firstNameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _firstNameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _firstNameInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3.5,
                  ),
                  TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.person)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter last Name',
                      label: Text(
                        'Enter last Name',
                        style: kEncodeSansSemiBold.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                      ),
                      errorText: _lastNameInputIsValid
                          ? null
                          : 'please enter only alphabetical characters only!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _lastNameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _lastNameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _lastNameInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3.5,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.email)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter Email Address',
                      label: Text(
                        'Enter Email Address',
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
                    height: sizeHorizontal * 3.5,
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
                    height: sizeHorizontal * 3.5,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible1,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconTheme(
                        data: const IconThemeData(color: kDarkGrey),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          icon: _passwordVisible1
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.security)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Confrim Password',
                      label: Text(
                        'Confirm Password',
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
                    height: sizeHorizontal * 3.5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          // value: false,
                          onChanged: (newValue) {
                            if (newValue != null) {
                              setState(() {
                                _isCheck = newValue;
                              });
                            }
                          },
                          value: _isCheck),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'By Proceeding you agree to the Jero Pay Privacy Policy',
                          style: kEncodeSansMedium.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.8,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: sizeHorizontal * 4,
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
                                  if (_firstNameController!.text.isEmpty ||
                                      _lastNameController!.text.isEmpty ||
                                      _userNameController!.text.isEmpty ||
                                      _emailController!.text.isEmpty ||
                                      _passwordController!.text.isEmpty ||
                                      _confirmPasswordController!
                                          .text.isEmpty) {
                                    // ekwere
                                    warning(
                                        message: 'fields cant\'t be empty',
                                        context: context);
                                  } else if (!_isCheck) {
                                    warning(
                                        message:
                                            'agree to our privacy policy!!!',
                                        context: context);
                                  } else if (_passwordController!.text !=
                                      _confirmPasswordController!.text) {
                                    warning(
                                        message: 'password not the same!!!',
                                        context: context);
                                  } else {
                                    value.RegisterUser(
                                        first_name:
                                            _firstNameController!.text.trim(),
                                        last_name:
                                            _lastNameController!.text.trim(),
                                        // phone:  _phoneController.text.trim(),
                                        email: _emailController!.text.trim(),
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
                                        'Register',
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
                    }),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  Text.rich(TextSpan(
                      text: "Have an account already? ",
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 2.2),
                      children: [
                        TextSpan(
                            text: 'Sign In ',
                            style: kEncodeSansBold.copyWith(
                                color: kBlack,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 2.2),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/Login", (route) => false);
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
