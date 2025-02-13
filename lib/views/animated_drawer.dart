import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/model/drawer_items.dart';
import 'package:databank/views/airtime_top_up.dart';
import 'package:databank/views/history.dart';
import 'package:databank/views/home_screen.dart';
import 'package:databank/views/profile.dart';
import 'package:databank/views/recharge_card.dart';
import 'package:databank/views/result_checker.dart';
import 'package:databank/views/reward.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/drawer_item.dart';
import 'cable_subscription.dart';
import 'contact.dart';
import 'data_pin.dart';
import 'data_top_up.dart';
import 'drawer_widget.dart';

class AnimatedDrawer extends StatefulWidget {
  const AnimatedDrawer({super.key});

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  late double scaleFactor;
  late double xOffset;
  late double yOffset;
  late bool isDragggable = false;
  late bool isDrawerOpen;
  DrawerItem value = DrawerItems.profile;
  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 70;
        scaleFactor = 0.75;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      body: Stack(
        children: [
          SafeArea(
            child: BuildDrawer(
              onSelectedItem: (DrawerItem value) {
                switch (value) {
                  case DrawerItems.logout:
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logged Out!!!')));
                    context.read<DataBaseProvider>().logOut(context);
                    return;
                  default:
                    setState(() {
                      this.value = value;
                      closeDrawer();
                    });
                }
              },
            ),
          ),
          buildpage(),
        ],
      ),
    );
  }

  Widget buildpage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragggable = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragggable) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragggable = false;
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 140),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
                absorbing: isDrawerOpen,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                    child: Container(child: getDrawerPage(value))))),
      ),
    );
  }

  Widget getDrawerPage(value) {
    switch (value) {
      case DrawerItems.profile:
        return ProfileScreen(openDrawer: openDrawer);
      case DrawerItems.reward:
        return RewardScreen(openDrawer: openDrawer);
      case DrawerItems.history:
        return HistoryScreen(openDrawer: openDrawer);
      case DrawerItems.contact:
        return Contactdatabank(openDrawer: openDrawer);
      case DrawerItems.airtime:
        return const AirtimeTopUp();
      case DrawerItems.data:
        return const DataTopUp();
      case DrawerItems.dataPin:
        return const DataPin();
      case DrawerItems.cable:
        return const CableSubscription();
      case DrawerItems.result:
        return ResultChecker();
      case DrawerItems.card:
        return const RechargeCard();
      default:
        return HomeScreen(openDrawer: openDrawer);
    }
  }
}
