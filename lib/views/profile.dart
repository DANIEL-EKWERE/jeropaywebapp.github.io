import 'package:databank/customizations/app_style.dart';
import 'package:databank/customizations/size_config.dart';
import 'package:databank/views/reset_password.dart';
import 'package:databank/views/reset_pin.dart';
import 'package:flutter/material.dart';

import '../widget/drawer_widget.dart';
import 'contact_data_bank.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  final EdgeInsetsGeometry padding =
      const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10);
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
          onClicked: openDrawer,
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
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: kGrey,
                  backgroundImage: AssetImage('assets/images/pic-2.png'),
                ),
                SizedBox(
                  width: sizeHorizontal * 2.0,
                ),
                TextButton.icon(
                    style: const ButtonStyle(
                        // padding:
                        ),
                    onPressed: () {},
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
                          text: 'Daniel',
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
                          text: 'Ekwere',
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
                          text: 'Daniel Ekwere',
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
                          text: 'ekweredaniel8@gmail.com',
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
                          text: '07043194111',
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
                    Navigator.of(context).push(MaterialPageRoute(
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
                  'Reset Transaction Pin',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.open_in_browser_outlined),
                  color: kGrey,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ResetPin()));
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
                  onPressed: () {},
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
                    Navigator.of(context).push(MaterialPageRoute(
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
                Text(
                  'Log Out',
                  style: kEncodeSansMedium.copyWith(
                      color: kGrey, fontSize: sizeVertical * 2.3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
