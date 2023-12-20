// import 'dart:html';
import 'dart:io';

import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../customizations/size_config.dart';
import '../widget/snackbar.dart';

class SendPaymentProofToAdmin extends StatefulWidget {
  const SendPaymentProofToAdmin({super.key});

  @override
  State<SendPaymentProofToAdmin> createState() => _CreatUserProfileState();
}

class _CreatUserProfileState extends State<SendPaymentProofToAdmin> {
  
  String? selectedValue;
  // File? _imageFile;
  // File? pickedFile;
  File? profileImage;
  // String _mlResult = 'No Result';
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeVertical!;

    return Scaffold(
       appBar: AppBar(
        title: Text('Send Proof'),
        centerTitle: true,
       ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/logo-1.svg'),
              SizedBox(
                height: sizeHorizontal * 5,
              ),
              Text(
                'Send proof of payment to the admin and you\'ll be created when received and validated',
                style: kEncodeSansBold.copyWith(
                    color: kGrey, fontSize: sizeHorizontal * 3.5),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: kWhite,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text('Send to Admin throught whatsApp'),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3.5,
                  ),
                  
                ],
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        // final picker = ImagePicker();
                        try {
                          final pickedFile = await _picker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            // Navigator.pop(context, File(pickedFile.path));
                            setState(() {
                              profileImage = File(pickedFile.path);
                            });
                          }
                        } catch (e) {
                          print(e);
                          Navigator.pop(context, null);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: kWhite,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text('Select Image From Phone'),
                    ),
                  ),
                  SizedBox(
                    height: sizeHorizontal * 3.5,
                  ),
                  if (profileImage != null)
                    Image.file(
                      profileImage!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
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
                                  Color(0xff373737),
                                  Color(0xff6A6A6A),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: ElevatedButton(
                            onPressed: () async { 
                                value.SendPaymentProof(
                                    profile_picture: profileImage,
                                    context: context);
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    'Complete Profile',
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
                // child:
              ),
            ],
          ),
        ),
      ),
    );
  }
}
