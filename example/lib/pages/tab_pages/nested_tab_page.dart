import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class NestedTabPage extends StatefulWidget {
  static const routeName = '/nested_tab_page';
  @override
  _NestedTabPageState createState() => _NestedTabPageState();
}

class _NestedTabPageState extends State<NestedTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Nested Tab Page'),
            ],
          ),
        ),
      ),
    );
  }
}
