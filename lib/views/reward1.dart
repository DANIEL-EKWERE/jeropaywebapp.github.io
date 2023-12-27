import 'package:databank/backend/provider/database/db_provider.dart';
import 'package:databank/customizations/app_style.dart';
import 'package:databank/views/about_us.dart';
import 'package:databank/views/profile.dart';
import 'package:databank/views/reward.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/drawer_item.dart';
import '../model/drawer_items.dart';
import 'contact.dart';
import 'drawer_widget.dart';
import 'history.dart';
import 'home_screen.dart';

class RewardScreen1 extends StatefulWidget {
  const RewardScreen1({
    super.key,
  });
  @override
  State<RewardScreen1> createState() => _RewardScreen1State();
}

class _RewardScreen1State extends State<RewardScreen1> {
  late double scaleFactor;
  late double xOffset;
  late double yOffset;
  late bool isDragggable = false;
  late bool isDrawerOpen;
  DrawerItem value = DrawerItems.reward;

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
      backgroundColor: kGrey,
      body: Stack(
        children: [
          SafeArea(
            child: BuildDrawer(
              onSelectedItem: (DrawerItem value) {
                switch (value) {
                  case DrawerItems.logout:
                  context
                                        .read<DataBaseProvider>()
                                        .logOut(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Log Out sucesful!!!'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Logged Out!!!')));
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
                  child: Container(
                      decoration: BoxDecoration(
                        color: isDrawerOpen
                            ? Colors.white.withOpacity(.05)
                            : kLightGrey,
                      ),
                      child: getDrawerPage(value)),
                ))),
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
        return ContactDataBank(openDrawer: openDrawer);
      case DrawerItems.about:
        return const AboutUs();
      default:
        return HomeScreen(openDrawer: openDrawer);
    }
  }
}
