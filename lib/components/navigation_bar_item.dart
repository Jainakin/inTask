import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavBarItem extends StatefulWidget {
  IconData icon;
  NavBarItem({required this.icon});

  @override
  State<NavBarItem> createState() => _NavBarItemState(icon: icon);
}

class _NavBarItemState extends State<NavBarItem> {
  IconData icon;
  _NavBarItemState({required this.icon});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        this.icon,
        size: 25.0,
        color: Colors.white,
      ),
      selectedIcon: Icon(
        this.icon,
        size: 25.0,
        color: CupertinoColors.activeBlue,
      ),
      label: 'NA',
    );
  }
}
