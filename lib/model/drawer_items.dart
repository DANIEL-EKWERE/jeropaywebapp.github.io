import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerItems {
  static const data = DrawerItem(name: 'Data', icon: Icons.home);
  static const airtime = DrawerItem(name: 'Airtime', icon: Icons.network_cell_rounded);
  static const card = DrawerItem(name: 'Card', icon: Icons.card_membership);
  static const dataPin = DrawerItem(name: 'Data Pin', icon: Icons.pin);
  static const cable = DrawerItem(name: 'Cable', icon: Icons.cable);
  static const result = DrawerItem(name: 'Result', icon: Icons.grade);
  static const home = DrawerItem(name: 'Home', icon: Icons.home);
  static const profile = DrawerItem(name: 'Profile', icon: Icons.person);
  static const reward = DrawerItem(name: 'Reward', icon: Icons.diamond);
  static const history = DrawerItem(name: 'History', icon: Icons.history);
  static const about = DrawerItem(name: 'About', icon: Icons.info);
  static const contact = DrawerItem(name: 'Contact', icon: Icons.contact_emergency);
  static const close = DrawerItem(name: 'Close', icon: Icons.close_rounded);
  static const logout = DrawerItem(name: 'Logout', icon: Icons.logout);

  static final List<DrawerItem> all = [
    // data,
    // airtime,
    // card,
    // dataPin,
    // cable,
    // result,
    home,
    profile,
    reward,
    history,
    about,
    contact,
    close,
    logout,
  ];
}
