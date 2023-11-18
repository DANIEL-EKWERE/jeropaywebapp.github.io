import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/button.dart';
import 'package:databank/widget/textField.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  final TextEditingController textController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeVertical!;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: kEncodeSansBold.copyWith(
                    color: kGrey, fontSize: sizeHorizontal * 3.5),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField(
                  'Enter Old Password', 'Enter Old Password', textController1),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField(
                  'Enter New Password', 'Enter New Password', textController2),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField('Confirm New Password', 'Confirm New Password',
                  textController3),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              button(text1:'Reset Password',isLoading1:false,tap:() {})
            ],
          ),
        ),
      ),
    );
  }
}
