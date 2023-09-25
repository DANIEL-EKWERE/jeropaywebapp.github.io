import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

import '../customizations/size_config.dart';

class DropdownTextField extends StatefulWidget {
  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  // Declare variables for tracking the selected value and list of items
  String? selectedValue;
  List<String> dropdownItems = [
    'MTN',
    'AIRTEL',
    'GLO',
    '9 MOBILE',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            labelText: 'Select an option',
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
                Radius.circular(20),
              ),
            ),
          ),
        ),


  


        // const SizedBox(height: 20),
        // TextFormField(
        //   onTap: () {
        //     // Open the dropdown when the text field is clicked
        //     FocusScope.of(context).requestFocus(new FocusNode());
        //   },
        //   decoration: const InputDecoration(
        //     labelText: 'Text Field',
        //     border: OutlineInputBorder(),
        //     suffixIcon: Icon(Icons.arrow_drop_down),
        //   ),
        //   readOnly: true, // Make the text field read-only
        //   controller: TextEditingController(
        //     text: selectedValue, // Display the selected value in the text field
        //   ),
        // ),

        // Switch(value: selectedValue == 'MTN', onChanged: (value) {
          
        // },
        
        // ),
      ],
    );
  }
}




void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Text Field Example'),
      ),
      body: Center(
        child: DropdownTextField(),
      ),
    ),
  ));
}
