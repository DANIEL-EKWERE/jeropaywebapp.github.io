import 'package:cool_alert/cool_alert.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/textField.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../customizations/size_config.dart';
// import '../firebase_options.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
  final RegExp usernameExp = RegExp(r'^[a-zA-Z0-9*\-_@/\\]+$');
  bool _nameInputIsValid = true;
  bool _usernameInputIsValid = true;
  bool _passwordVisible = true;
  bool _numberInputIsValid = true;
  bool _isCheck = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userNameController.dispose();
    _phoneController.dispose();
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
                    height: sizeHorizontal * 5,
                  ),
                  SvgPicture.asset('assets/images/logo-1.svg'),
                  SizedBox(
                    height: sizeHorizontal * 5,
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
                    controller: _firstNameController,
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
                    height: sizeHorizontal * 3,
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
                      errorText: _nameInputIsValid
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
                          _nameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _nameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _nameInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
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
                      errorText: _nameInputIsValid
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
                          _nameInputIsValid = false;
                        });
                      } else if (!nameExp.hasMatch(value)) {
                        setState(() {
                          _nameInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _nameInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  // textFieldeName(
                  //     'Enter Username', 'Enter Username', _userNameController),
                  // SizedBox(
                  //   height: sizeHorizontal * 3,
                  // ),
                  TextField(
                    controller: _phoneController,
                    maxLength: 11,
                    // scrollPhysics: const BouncingScrollPhysics(),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: kDarkGrey),
                          child: Icon(Icons.phone)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter Phone',
                      label: Text(
                        'Enter Phone',
                        style: kEncodeSansSemiBold.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                      ),
                      errorText: _numberInputIsValid
                          ? null
                          : 'please enter a valid phone number!',
                      focusedBorder: kInputBorder,
                      border: kInputBorder,
                      filled: true,
                      fillColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      final v = int.tryParse(value);
                      if (v == null) {
                        setState(() {
                          _numberInputIsValid = false;
                        });
                      } else {
                        setState(() {
                          _numberInputIsValid = true;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  textFieldEmail(
                      'Enter Email', 'Enter Email', _emailController),
                  SizedBox(
                    height: sizeHorizontal * 3,
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
                    height: sizeHorizontal * 3,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible,
                    controller: _confirmPasswordController,
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
                    height: sizeHorizontal * 3,
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
                          'By Proceeding you agree to the DataBank Privacy Policy',
                          style: kEncodeSansMedium.copyWith(
                            color: kDarkGrey,
                            fontSize: SizeConfig.blockSizeHorizontal! * 1.8,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
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
                                // await Firebase.initializeApp(
                                //   options:
                                //       DefaultFirebaseOptions.currentPlatform,
                                // );
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                if (
                                    // _firstNameController.text == '' ||
                                    //   _lastNameController.text == '' ||
                                    //   _userNameController.text == '' ||
                                    //   _phoneController.text == '' ||
                                    _emailController.text == '' ||
                                        _passwordController.text == '' ||
                                        // ignore: unrelated_type_equality_checks
                                        _confirmPasswordController == '') {
                                  CoolAlert.show(
                                    backgroundColor: kGrey,
                                    confirmBtnColor: Colors.green,
                                    context: context,
                                    title: 'Empty Selections!!!',
                                    text:
                                        'input fields cannot be empty,please fill in the fields and try again!',
                                    type: CoolAlertType.error,
                                    animType: CoolAlertAnimType.rotate,
                                  );
                                } else if (!_isCheck) {
                                  CoolAlert.show(
                                    backgroundColor: kGrey,
                                    confirmBtnColor: Colors.green,
                                    context: context,
                                    title: 'Privacy Policy!!!',
                                    text: 'Agree to our terms and conditions!',
                                    type: CoolAlertType.error,
                                    animType: CoolAlertAnimType.rotate,
                                  );
                                } else if (_passwordController.text !=
                                    _confirmPasswordController.text) {
                                  CoolAlert.show(
                                    backgroundColor: kGrey,
                                    confirmBtnColor: Colors.green,
                                    context: context,
                                    title: 'Password Not Same!!!',
                                    text: 'Password not the same',
                                    type: CoolAlertType.error,
                                    animType: CoolAlertAnimType.rotate,
                                  );
                                } else {
                                  // final userCredentials = await FirebaseAuth
                                  //     .instance
                                  //     .createUserWithEmailAndPassword(
                                  //         email: email, password: password);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "/App_Layout", (route) => false);

                                  // await FirebaseAuth.instance.currentUser
                                  //     ?.sendEmailVerification();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  foregroundColor: kWhite,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: const Text('Register'),
                            ),
                          ),
                        ),
                      ],
                    ),
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
