import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecondTabPage extends StatefulWidget {
  @override
  _SecondTabPageState createState() => _SecondTabPageState();
}

class _SecondTabPageState extends State<SecondTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Second Tab Page'),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: () {},
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
