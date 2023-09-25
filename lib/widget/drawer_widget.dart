import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

class DrawerMenueWidget extends StatelessWidget {
  const DrawerMenueWidget(
      {super.key, required this.onClicked, required this.color});
  final VoidCallback onClicked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.menu,
          color: color,
        ),
        color: kWhite,
        onPressed: onClicked);
  }
}
