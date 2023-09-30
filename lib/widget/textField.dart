import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import '../customizations/size_config.dart';

TextField textField(
  label1,
  hintText1,
  textController,
) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    // keyboardType: TextInputType.number,
    controller: textController,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}

TextField textFieldEmail(
  label1,
  hintText1,
  textController,
) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    keyboardType: TextInputType.emailAddress,
    controller: textController,
    decoration: InputDecoration(
      prefixIcon: const IconTheme(
          data: IconThemeData(color: kDarkGrey), child: Icon(Icons.email)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}

TextField textFieldNumber(label1, hintText1, textController, newValue) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    controller: textController,
    onChanged: (value) {
      newValue = value;
    },
    // scrollPhysics: const BouncingScrollPhysics(),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}

TextField textFieldNumber1(label1, hintText1, textController) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    controller: textController,
    // scrollPhysics: const BouncingScrollPhysics(),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}

TextField textFieldPhoneNumber(label1, hintText1, textController) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    controller: textController,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      prefixIcon: const IconTheme(
          data: IconThemeData(color: kDarkGrey), child: Icon(Icons.phone)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}

TextField textFieldeName(label1, hintText1, textController) {
  String label = label1;
  String hintText = hintText1;
  return TextField(
    controller: textController,
    keyboardType: TextInputType.name,
    decoration: InputDecoration(
      prefixIcon: const IconTheme(
          data: IconThemeData(color: kDarkGrey), child: Icon(Icons.person)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      hintText: hintText,
      label: Text(
        label,
        style: kEncodeSansSemiBold.copyWith(
            color: kDarkGrey, fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
      ),
      //errorText: 'please enter the meter type!',
      focusedBorder: kInputBorder,
      border: kInputBorder,
      filled: true,
      fillColor: kLightGrey,
    ),
  );
}
