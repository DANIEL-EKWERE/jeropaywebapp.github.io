import 'package:flutter/material.dart';

import '../customizations/app_style.dart';

FloatingActionButton fab() {
  return FloatingActionButton(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    foregroundColor: kBlack,
    backgroundColor: kBlack,
    onPressed: () {},
    child: const Icon(
      Icons.message,
      color: kWhite,
    ),
  );
}
