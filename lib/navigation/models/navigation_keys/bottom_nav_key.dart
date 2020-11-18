import 'package:flutter/material.dart';

///It's wrapper of [GlobalKey] for implementation [BottomNavigationBar].
class BottomNavKey {
  final GlobalKey<NavigatorState> key;

  BottomNavKey(this.key);
}
