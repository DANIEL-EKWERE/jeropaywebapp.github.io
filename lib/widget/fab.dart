import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri url = Uri.parse('https://wa.link/q07ccc');

FloatingActionButton fab() {
  return FloatingActionButton(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    foregroundColor: kBlack,
    backgroundColor: kBlack,
    onPressed: () async {
      if (!await launchUrl(url)) {
                throw Exception('could\'t load link $url');
              }
    },
    child: const Icon(
      Icons.message,
      color: kWhite,
    ),
  );
}
