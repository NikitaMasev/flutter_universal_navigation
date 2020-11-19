import 'package:flutter/material.dart';
import 'package:universal_navigation/universal_navigation.dart';

class DefaultBottomNavBridge with BottomNavigationBuilder{
  final BottomNavKey bottomNavKey;
  final List<TabFlow> tabFlows;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const DefaultBottomNavBridge({
    @required this.bottomNavKey,
    @required this.tabFlows,
    @required this.backgroundColor,
    @required this.selectedItemColor,
    @required this.unselectedItemColor,
  });

  @override
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

  @override
  List<TabFlow> getTabFlows() {
    return tabFlows;
  }
}