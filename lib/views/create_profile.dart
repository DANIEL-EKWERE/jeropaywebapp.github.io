// import 'dart:html';
import 'dart:io';

import 'package:databank/backend/provider/auth_provider/auth_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/widget/button.dart';
// import 'package:databank/widget/textField.dart';
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
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              // SizedBox(
              //   height: sizeHorizontal * 5,
              // ),
              SvgPicture.asset('assets/images/logo-1.svg'),
              SizedBox(
                height: sizeHorizontal * 5,
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
                  focusedBorder: kInputBorder,
                  fillColor: kLightGrey,
                  filled: true,
                  labelText: 'Select Location',
                  labelStyle: kEncodeSansSemiBold.copyWith(
                      color: kDarkGrey,
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
                  focusedBorder: kInputBorder,
                  fillColor: kLightGrey,
                  filled: true,
                  labelText: 'Select State',
                  labelStyle: kEncodeSansSemiBold.copyWith(
                      color: kDarkGrey,
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
                  prefixIcon: const IconTheme(
                      data: IconThemeData(color: kDarkGrey),
                      child: Icon(Icons.phone)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
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
                height: sizeHorizontal * 3.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (profileImage != null)
                    Image.file(
                      profileImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
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
                ],
              ),
              SizedBox(
                height: sizeHorizontal * 3.5,
              ),

              Consumer<AuthenticationProvider>(
                builder: (context, value, child) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (value.reqMessage != '') {
                      successMessage(message: value.reqMessage, context: context);

                      value.clear();
                    }
                  });
                  return button(
                    text1: 'Complete Profile',
                    isLoading1: value.isLoading,
                    tap: () {
                      if (selectedValue!.isEmpty ||
                          selectedValue2!.isEmpty ||
                          textController3.text.isEmpty ||
                          profileImage == null) {
                        warning(message: 'fields can\'t be empty!');
                      } else {
                        value.CreateUserProfile(
                            location: selectedValue!,
                            phone: textController3.text.trim(),
                            state: selectedValue2!,
                            profile_picture: profileImage,
                            context: context);
                      }
                    },
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
