import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/components/navigation_bar_item.dart';
import 'package:intask/constants.dart';

int Index = 0;

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Screens[Index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.white.withOpacity(0.0),
          ),
          child: NavigationBar(
            selectedIndex: Index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) => setState(() {
              Index = index;
            }),
            height: 60.0,
            backgroundColor: Colors.black,
            destinations: [
              NavBarItem(icon: CupertinoIcons.home),
              NavBarItem(icon: CupertinoIcons.hammer_fill),
              NavBarItem(icon: CupertinoIcons.rectangle_paperclip),
            ],
          ),
        ),
      ),
    );
  }
}
