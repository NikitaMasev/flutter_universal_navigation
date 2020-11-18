import 'package:flutter/material.dart';

///It's wrapper of [GlobalKey] for [MaterialApp] in main.dart.
class GlobalNavKey {
  final GlobalKey<NavigatorState> key;

  GlobalNavKey(this.key);
}