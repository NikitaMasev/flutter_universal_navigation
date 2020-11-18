import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';

///Mixing for build certain realization of BottomNavigationBar.
///Also implementation should contain list of tab flow (root pages of bottom navigation bar item).
mixin BottomNavigationBuilder {

  ///Will be called inside [BottomNavigationPage] for building concrete implementation of bottom navigation bar.
  Widget build(int currentIndexTab, Function(int) onTabChanged);

  ///Will be called inside [BottomNavigationPage] for getting list of tab flow(root pages of navigation bar item).
  List<TabFlow> getTabFlows();
}
