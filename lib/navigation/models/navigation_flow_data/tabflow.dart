import 'package:flutter/material.dart';

/// Contain root page of navigation bar item and some config.
class TabFlow {
  ///Will be used in title navigation bar item.
  final String title;

  ///Should be used if [iconData] not presented.
  final AssetImage? assetImage;
  final IconData? iconData;

  ///Used for nesting navigation inside [BottomNavigationPage]
  final GlobalKey<NavigatorState> navigatorKey;

  ///Root page of navigation bar item.
  final Widget page;

  TabFlow({
    this.title = '',
    this.assetImage,
    this.iconData,
    required this.navigatorKey,
    required this.page,
  });
}
