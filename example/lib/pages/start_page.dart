import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation_example/events.dart';
import 'package:universal_navigation_example/pages/login_page.dart';

@injectable
class StartPage extends StatefulWidget {
  static const routeName = '/start_page';

  final NavigationController<EventData> _navigationController;

  const StartPage(this._navigationController);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Start Page'),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () {
                    widget._navigationController.pushGlobalPage(LoginPage.routeName, eventData: EventData(event: Event.Login, data: 'Text from Start page'));
                  },
                  child: Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
