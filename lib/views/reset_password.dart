import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/textField.dart';
import 'package:provider/provider.dart';
import '../widget/snackbar.dart';
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
                'Reset Password.',
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
                                 purple,purple
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (textController1.text.isEmpty ||
                                    textController2.text.isEmpty ||
                                    textController3.text.isEmpty) {
                                  warning(
                                      message: 'fields cant\'t be empty',
                                      context: context);
                                } else if (textController2.text !=
                                    textController3.text) {
                                  warning(
                                      message:
                                          'new password not the same as confirm password!!!',
                                      context: context);
                                } else {
                                  final result = await value.changePassword(
                                    old_password: textController1.text.trim(),
                                    new_password: textController2.text.trim(),
                                  );
                                  if (result) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            "/App_Layout", (route) => false);
                                  }
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
                                      'reset password',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
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
            ],
          ),
        ),
      ),
    );
  }
}
