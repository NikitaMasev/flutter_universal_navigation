import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:universal_navigation/navigation/core/navigation_controller.dart';
import 'package:universal_navigation_example/event_union.dart';
import 'package:universal_navigation_example/pages/tab_pages/nested_tab_page.dart';

@injectable
class FirstTabPage extends StatefulWidget {
  final NavigationController<EventUnion> _navigationController;

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
                    widget._navigationController.pushTabNestedPage(NestedTabPage.routeName);
                  },
                  child: Text('NEXT TO NESTED PAGE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
