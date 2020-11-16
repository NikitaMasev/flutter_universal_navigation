import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';

mixin BottomNavigationBuilder {
  Widget build(int currentIndexTab, Function(int) onTabChanged);

  List<TabFlow> getTabFlows();
}