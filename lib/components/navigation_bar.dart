import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'navigation_bar_item.dart';

int Index = 0;

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.white.withOpacity(0.0),
      ),
      child: NavigationBar(
        selectedIndex: Index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) => setState(() {
          Index = index;
          // if (index != 0) {
          //   Navigator.pushNamed(context, bottomNavDestinations[index]);
          // };
        }),
        height: 60.0,
        backgroundColor: Colors.white.withOpacity(0.0),
        destinations: [
          NavBarItem(icon: CupertinoIcons.home),
          NavBarItem(icon: CupertinoIcons.rectangle_paperclip),
          NavBarItem(icon: CupertinoIcons.hammer_fill),
        ],
      ),
    );
  }
}
