import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/bottom_navigation_page.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation_example/events.dart';

@injectable
class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  final NavigationController<TypeEvent> _navigationController;

  const LoginPage(this._navigationController);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextField(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextButton(
                    onPressed: () {
                      widget._navigationController.pushGlobalPage(BottomNavigationPage.routeName);
                    },
                    child: Text('ENTRY'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
