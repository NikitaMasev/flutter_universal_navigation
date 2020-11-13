import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';

class BottomNavigationBridge {
  final BottomNavKey bottomNavKey;
  final List<TabFlow> tabFlows;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const BottomNavigationBridge({
    @required this.bottomNavKey,
    @required this.tabFlows,
    @required this.backgroundColor,
    @required this.selectedItemColor,
    @required this.unselectedItemColor,
  });

  Widget build(int currentIndexTab, Function(int) onTabChanged) {
    return BottomNavigationBar(
      key: bottomNavKey.key,
      backgroundColor: backgroundColor,
      selectedItemColor:selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      currentIndex: currentIndexTab,
      items: tabFlows
          .map((e) => BottomNavigationBarItem(icon: Icon(e.iconData), label: e.title))
          .toList(),
      onTap: onTabChanged,
    );
  }
}
