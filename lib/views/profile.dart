import 'dart:io';

import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:databank/views/about_us.dart';
import 'package:databank/views/reset_password.dart';
import 'package:databank/views/set_transaction_pin.dart';
import 'package:databank/views/update_profile.dart';
import 'package:databank/widget/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widget/drawer_widget.dart';
import 'contact_data_bank.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var pImage;
  var firstName;
  var lastName;
  var email;
  var phone;
  var userName;
  @override
  void initState() {
    super.initState();

    // _profileImage();
    gatheUserName();
    gatheUserEmail();
    gatheUserPhoneNumber();
    gatheUserfirstName();
    gatheUserLastName();
  }

  // Future _profileImage() async {
  //   final image = await DataBaseProvider().getProfileImage();
  //   setState(() {
  //     pImage = image;
  //   });
  // }

  Future gatheUserName() async {
    final username = await DataBaseProvider().getUserName();

    setState(() {
      userName = username;
    });
  }

  Future gatheUserEmail() async {
    final userEmail = await DataBaseProvider().getEmail();

    setState(() {
      email = userEmail;
    });
  }

  Future gatheUserPhoneNumber() async {
    final userPhone = await DataBaseProvider().getPhone();

    setState(() {
      phone = userPhone;
    });
  }

  Future gatheUserfirstName() async {
    final userfirstName = await DataBaseProvider().getFirstName();

    setState(() {
      firstName = userfirstName;
    });
  }

  Future gatheUserLastName() async {
    final userLastName = await DataBaseProvider().getLastName();

    setState(() {
      lastName = userLastName;
    });
  }

  final EdgeInsetsGeometry padding =
      const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10);
  File? profileImage;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: kEncodeSansMedium.copyWith(
              color: kGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
        ),
        leading: DrawerMenueWidget(
          onClicked: widget.openDrawer,
          color: kGrey,
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Text(
                //   'Personal Info',
                //   style: kEncodeSansMedium.copyWith(
                //       color: kGrey, fontSize: sizeVertical * 1.8),
                // ),
                const Spacer(),

                CircleAvatar(
                  radius: 60,
                  backgroundColor: kGrey,
                  backgroundImage:
                      AssetImage(pImage ?? 'assets/images/pic-2.png'),
                ),
                SizedBox(
                  width: sizeHorizontal * 2.0,
                ),
                TextButton.icon(
                    style: const ButtonStyle(
                        // padding:
                        ),
                    onPressed: () async {
                      // final picker = ImagePicker();
                      try {
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedFile != null) {
                          // Navigator.pop(context, File(pickedFile.path));
                          setState(() {
                            pImage = File(pickedFile.path);
                          });
                          DataBaseProvider().saveProfileImage(profileImage);
                        }
                      } catch (e) {
                        print(e);
                        Navigator.pop(context, null);
                      }
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 15,
                    ),
                    label: const Text('Edit'))
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            const Divider(),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            Text(
              'User Infomation',
              style: kEncodeSansSemiBold.copyWith(
                  color: kGrey, fontSize: sizeVertical * 2.3),
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_rounded,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'First Name: ',
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                      children: <TextSpan>[
                        TextSpan(
                          text: firstName,
                          style: kEncodeSansBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_rounded,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Last Name: ',
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                      children: <TextSpan>[
                        TextSpan(
                          text: lastName,
                          style: kEncodeSansBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person_rounded,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'User Name: ',
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                      children: <TextSpan>[
                        TextSpan(
                          text: userName,
                          style: kEncodeSansBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Email: ',
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                      children: <TextSpan>[
                        TextSpan(
                          text: email,
                          style: kEncodeSansBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Phone Number: ',
                      style: kEncodeSansMedium.copyWith(
                          color: kGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 1.8),
                      children: <TextSpan>[
                        TextSpan(
                          text: phone,
                          style: kEncodeSansBold.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            const Divider(),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            const Divider(),
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                Text(
                  'Update Profile',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => UpdateUserProfile()));
                  },
                )
              ],
            ),
            const Divider(),
            Text(
              'Password',
              style: kEncodeSansMedium.copyWith(
                  color: kGrey, fontSize: sizeVertical * 2.3),
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                Text(
                  'Reset Password',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => ResetPassword()));
                  },
                )
              ],
            ),

            // SizedBox(
            //   height: sizeHorizontal * 2.0,
            // ),
            Row(
              children: [
                const Icon(
                  Icons.edit,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                Text(
                  'Set Transaction Pin',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SetTransactionPin()));
                  },
                )
              ],
            ),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            const Divider(),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            Text(
              'App Info',
              style: kEncodeSansMedium.copyWith(
                  color: kGrey, fontSize: sizeVertical * 2.3),
            ),
            SizedBox(
              height: sizeHorizontal * 2.5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.book_sharp,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                Text(
                  'About Data Bank',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const AboutUs()));
                  },
                )
              ],
            ),
            // SizedBox(
            //   height: sizeHorizontal * 2.0,
            // ),
            Row(
              children: [
                const Icon(
                  Icons.contact_emergency,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                Text(
                  'Contact Data Bank',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const ContactDataBank()));
                  },
                ),
              ],
            ),

            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            const Divider(),
            SizedBox(
              height: sizeHorizontal * 2.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: kGrey,
                ),
                SizedBox(
                  width: sizeHorizontal * 2.5,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Confirm Log Out'),
                              content: Text(
                                  'Your sure you want to log out of your data bank account?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await context
                                        .read<DataBaseProvider>()
                                        .logOut(context);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //     content: Text('Log Out sucesful!!!'),
                                    //     backgroundColor: Colors.green,
                                    //   ),
                                    // );
                                    successMessage(
                                        context: context,
                                        message: 'Log Out sucesful!!!',
                                        x: Color.fromARGB(255, 15, 175, 20));
                                  },
                                  child: Text('yes'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel'),
                                ),
                              ]);
                        });
                    Future.delayed(
                      const Duration(seconds: 5),
                    ).then((value) => context.read<DataBaseProvider>().logOut(context));
                    
                  },
                  child: Text(
                    'Log Out',
                    style: kEncodeSansMedium.copyWith(
                        color: kGrey, fontSize: sizeVertical * 2.3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
