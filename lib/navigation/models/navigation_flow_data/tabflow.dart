import 'package:flutter/material.dart';

class TabFlow {
  final String title;
  final AssetImage assetImage;
  final IconData iconData;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget page;

  TabFlow({this.title = '', this.assetImage, this.iconData, @required this.navigatorKey, @required this.page});
}