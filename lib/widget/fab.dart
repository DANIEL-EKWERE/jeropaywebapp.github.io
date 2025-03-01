import 'package:flutter/material.dart';

import '../customizations/app_style.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri url = Uri.parse('https://wa.me/message/ANY4CTLLYEJBF1');

FloatingActionButton fab() {
  return FloatingActionButton(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    foregroundColor: purple,
    backgroundColor: purple,
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
