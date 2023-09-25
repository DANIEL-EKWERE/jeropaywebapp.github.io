import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/button.dart';
import 'package:databank/widget/textField.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class ResetPin extends StatelessWidget {
  ResetPin({super.key});
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
                'Reset Transaction Pin',
                style: kEncodeSansBold.copyWith(
                    color: kGrey, fontSize: sizeHorizontal * 3.5),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField(
                  'Enter Old Pin', 'Enter Old Pin', textController1),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField(
                  'Enter New Pin', 'Enter New Pin', textController2),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              textField('Confirm New Pin', 'Confirm New Pin',
                  textController3),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              button('Reset Password')
            ],
          ),
        ),
      ),
    );
  }
}
