import 'package:flutter/material.dart';

import '../views/airtime_top_up.dart';
import '../views/data_top_up.dart';

class Reward {
  final String title;
  final String subTitle;
  Widget? screen;
  final Color fcolor;
  final Color bcolor;
  Reward(
      {required this.title,
      required this.subTitle,
      required this.screen,
      required this.fcolor,
      required this.bcolor});
}

List<Reward> reward = [
  Reward(
    title: 'Glo Airtime',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const AirtimeTopUp(),
    fcolor: Colors.green,
    bcolor: const Color(0xFFC8E6C9),
  ),
  Reward(
    title: 'Airtel/Mtn Airtime',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const AirtimeTopUp(),
    fcolor: Colors.red,
    bcolor: const Color(0xFFFFCDD2),
  ),
  Reward(
    title: '9 mobile Airtime',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const AirtimeTopUp(),
    fcolor: const Color(0xFF1B5E20),
    bcolor: const Color(0xFFA5D6A7),
  ),
  Reward(
    title: 'Glo Data',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const DataTopUp(),
    fcolor: Colors.green,
    bcolor: const Color(0xFFC8E6C9),
  ),
  Reward(
    title: 'Airtel/Mtn Data',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const DataTopUp(),
    fcolor: Colors.yellow,
    bcolor: const Color(0xFFFFF9C4),
  ),
  Reward(
    title: '9 mobile Data',
    subTitle: 'buy airtime and gt up to #1 \ncash back',
    screen: const DataTopUp(),
    fcolor: const Color(0xFF1B5E20),
    bcolor: const Color(0xFFA5D6A7),
  ),
];
