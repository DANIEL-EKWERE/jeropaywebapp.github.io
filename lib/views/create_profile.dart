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

class CreatUserProfile extends StatefulWidget {
  const CreatUserProfile({super.key});

  @override
  State<CreatUserProfile> createState() => _CreatUserProfileState();
}

class _CreatUserProfileState extends State<CreatUserProfile> {
  final TextEditingController textController1 = TextEditingController();

  final TextEditingController textController2 = TextEditingController();

  final TextEditingController textController3 = TextEditingController();
  final TextEditingController textController4 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
  }

  bool _numberInputIsValid = true;
  String? selectedValue;
  // File? _imageFile;
  // File? pickedFile;
  File? profileImage;
  // String _mlResult = 'No Result';
  final _picker = ImagePicker();

  List<String> dropdownItems = [
    'Nigeria',
  ];

  String? selectedValue2;

  List<String> dropdownItems2 = [
    'Abuja',
    'Abia',
    'Adamawa',
    'Akwa Ibom',
    'Anambra',
    'Bauchi',
    'Bayelsa',
    'Benue',
    'Borno',
    'Cross River',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Gombe',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kano',
    'Katsina',
    'Kebbi',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nassarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'Rivers',
    'Sokoto',
    'Taraba',
    'Yobe',
    'Zamfara',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeHorizontal = SizeConfig.blockSizeVertical!;

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
              Text(
                'Create User Profile',
                style: kEncodeSansBold.copyWith(
                    color: kGrey, fontSize: sizeHorizontal * 3.5),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              DropdownButtonFormField<String>(
                value: selectedValue,
                items: dropdownItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                  focusedBorder: kInputBorder,
                  fillColor: kLightGrey,
                  filled: true,
                  labelText: 'Select Location',
                  labelStyle: kEncodeSansSemiBold.copyWith(
                      color: purple,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                  hintStyle: kEncodeSansSemiBold.copyWith(
                      color: kLightGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kBrown,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              DropdownButtonFormField<String>(
                value: selectedValue2,
                items: dropdownItems2.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue2 = value!;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                  focusedBorder: kInputBorder,
                  fillColor: kLightGrey,
                  filled: true,
                  labelText: 'Select State',
                  labelStyle: kEncodeSansSemiBold.copyWith(
                      color: purple,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                  hintStyle: kEncodeSansSemiBold.copyWith(
                      color: kLightGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kBrown,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),
              TextField(
                controller: textController3,
                maxLength: 11,
                // scrollPhysics: const BouncingScrollPhysics(),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                  prefixIcon: const IconTheme(
                      data: IconThemeData(color: purple),
                      child: Icon(Icons.phone)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  hintText: 'Enter Phone',
                  label: Text(
                    'Enter Phone',
                    style: kEncodeSansSemiBold.copyWith(
                        color: purple,
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
                           purple,purple
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
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: textController4,
                    decoration: InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: purple
                        )
                      ),
                      prefixIcon: const IconTheme(
                          data: IconThemeData(color: purple),
                          child: Icon(Icons.person_add_rounded)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      hintText: 'Enter Admin if none',
                      label: Text(
                        ' Enter Referral Code - Optional',
                        style: kEncodeSansSemiBold.copyWith(
                            color: purple,
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
                              if (selectedValue!.isEmpty ||
                                  selectedValue2!.isEmpty ||
                                  textController3.text.isEmpty || textController4.text.isEmpty) {
                                warning(message: 'fields can\'t be empty!');
                              } else {
                                value.CreateUserProfile(
                                    location: selectedValue!,
                                    phone: textController3.text.trim(),
                                    state: selectedValue2!,
                                    profile_picture: profileImage,
                                    recommended_by: textController1.text.trim(),
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
