import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/di/u_nav_configurator.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/globalflows.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/global_nav_key.dart';
import 'package:universal_navigation_example/di/injection.dart';
import 'package:universal_navigation_example/pages/start_page.dart';

void main() async {
  configureInjection(Environment.prod);
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Navigation Test App',
      initialRoute: StartPage.routeName,
      navigatorKey: getIt<GlobalNavKey>().key,
      debugShowCheckedModeBanner: false,
      routes: getIt<GlobalFlows>().flows,
    );
  }
}