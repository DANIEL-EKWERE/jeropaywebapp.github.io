import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import '../widget/drawer_widget.dart';

class LoginScreen1 extends StatelessWidget {
  const LoginScreen1({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
        leading: DrawerMenueWidget(
          onClicked: openDrawer,
          color: kGrey,
        ),
      ),
    );
  }
}
