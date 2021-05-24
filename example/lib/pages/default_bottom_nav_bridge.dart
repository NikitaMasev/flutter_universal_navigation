import 'package:flutter/material.dart';
import 'package:universal_navigation/universal_navigation.dart';

class DefaultBottomNavBridge implements BottomNavigationBuilder, TabChanger {
  final BottomNavKey bottomNavKey;
  final List<TabFlow> tabFlows;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  late BottomNavigationBar _bottomNavigationBar;

  DefaultBottomNavBridge({
    required this.bottomNavKey,
    required this.tabFlows,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  });

  @override
  Widget build(int currentIndexTab, Function(int) onTabChanged) {
    _bottomNavigationBar = BottomNavigationBar(
      key: bottomNavKey.key,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      currentIndex: currentIndexTab,
      items: tabFlows
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.iconData),
              label: e.title,
            ),
          )
          .toList(),
      onTap: onTabChanged,
    );
    return _bottomNavigationBar;
  }

  @override
  List<TabFlow> getTabFlows() {
    return tabFlows;
  }

  @override
  void onTap(int index) {
    _bottomNavigationBar.onTap?.call(index);
  }
}
