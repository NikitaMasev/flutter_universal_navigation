import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/universal_navigation.dart';
import 'package:universal_navigation_example/event_union.dart';

@injectable
class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  final NavigationController<EventUnion> _navigationController;

  const LoginPage(this._navigationController);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var text = 'Initial Text';

  @override
  void initState() {
    widget._navigationController.getEvents().listen((event) {
      event.when(() => null, login: (e) {
        setState(() {
          text = e;
        });
      });
    });
    super.initState();
  }

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
                      widget._navigationController
                          .pushGlobalPage(BottomNavigationPage.routeName);
                    },
                    child: Text('ENTRY'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
