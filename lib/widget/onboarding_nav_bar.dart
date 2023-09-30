import 'package:databank/customizations/app_style.dart';
import 'package:flutter/material.dart';

class OnboardingNavBar extends StatelessWidget {
  const OnboardingNavBar(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.buttonColor});
  final String name;
  final VoidCallback onPressed;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          
          style: kEncodeSansMedium.copyWith(color: kBlack),
        ),
      ),
    );
  }
}
