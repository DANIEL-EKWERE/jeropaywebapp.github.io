import 'package:flutter/material.dart';

void successMessage({String? message,Color? x, required BuildContext context}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message!,
      style:const  TextStyle(color: Colors.white),
      
      ),backgroundColor: x,));
}

// void error({String? message,Color? red, BuildContext? context}) {
//   ScaffoldMessenger.of(context!)
//       .showSnackBar(SnackBar(content: Text(message!,
//       style:const  TextStyle(color: Colors.white),
      
//       ),backgroundColor: Colors.red,));
// }

void warning({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!)
      .showSnackBar(SnackBar(content: Text(message!,
      style:const  TextStyle(color: Colors.white),
      
      ),backgroundColor: Colors.orange,));
}