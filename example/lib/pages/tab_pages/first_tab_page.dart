import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/universal_navigation.dart';
import 'package:universal_navigation_example/events.dart';
import 'package:universal_navigation_example/pages/tab_pages/nested_tab_page.dart';

@injectable
class FirstTabPage extends StatefulWidget {
  final NavigationController<EventData> _navigationController;

  const FirstTabPage(this._navigationController);

  @override
  _FirstTabPageState createState() => _FirstTabPageState();
}

class _FirstTabPageState extends State<FirstTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('First Tab Page'),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () {
                    widget._navigationController
                        .pushTabNestedPage(NestedTabPage.routeName);
                  },
                  child: Text('NEXT TO NESTED PAGE'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () =>
                      widget._navigationController.navigateToTab(1),
                  child: Text('To second tab'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
