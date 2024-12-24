import 'package:databank/customizations/size_config.dart';
import 'package:databank/views/home_screen1.dart';
import 'package:databank/views/reward1.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'animated_drawer.dart';
import 'history1.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  bool isChecked = false;
  int currentIndex = 1;
// late VoidCallback openDrawer; 
  

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen1(),
    const HistoryScreen1(),
    const RewardScreen1(),
    const AnimatedDrawer(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
//double sizeVertical = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8),
              ],
              borderRadius: BorderRadius.circular(30)),
          child: GNav(
          //  Color.fromARGB(255, 58, 71, 183)
            rippleColor: const Color.fromARGB(255, 58, 71, 183),
            hoverColor: const Color.fromARGB(255, 58, 71, 183),
            haptic: true,
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.blue[500]!, width: 1),
            tabBorder: Border.all(color: Colors.white, width: 1),
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            gap: 3,
            color: Colors.blue[800],
            activeColor: Colors.blue,
            iconSize: 24,
            tabBackgroundColor: Colors.blue.withOpacity(0.3),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.history,
                text: 'history',
              ),
              GButton(
                icon: Icons.diamond,
                text: 'Reward',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
