import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation/navigation/models/bottom_navigation_bridge.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';
import 'package:universal_navigation/navigation/models/navigation_keys/bottom_nav_key.dart';

class BottomNavigationPage extends StatefulWidget {
  static const routeName = '/bottom_navigation';

  final TabChangeListener tabChangeNotifier;
  final BottomNavigationBridge bottomNavigationBridge;

  const BottomNavigationPage(
      this.tabChangeNotifier,
      this.bottomNavigationBridge);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndexTab = 0;
  TabFlow _currentTabFlow;

  @override
  void initState() {
    _notifyUpdateTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _currentTabFlow.navigatorKey.currentState.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndexTab,
          children: widget
              .bottomNavigationBridge
              .tabFlows
              .map((tabFlow) => _buildIndexedTabFlow(tabFlow))
              .toList(),
        ),
        bottomNavigationBar: widget.bottomNavigationBridge.build(_currentIndexTab, _onTabChanged),
      ),
    );
  }

  void _notifyUpdateTab() {
    _currentTabFlow = widget.bottomNavigationBridge.tabFlows[_currentIndexTab];
    widget.tabChangeNotifier.notifyTabChanged(_currentTabFlow);
  }

  void _onTabChanged(int index) {
    setState(() {
      if (_currentIndexTab != index) {
        _currentIndexTab = index;
        _notifyUpdateTab();
      } else {
        _currentTabFlow.navigatorKey.currentState
            .popUntil((route) => route.isFirst);
      }
    });
  }

  Widget _buildIndexedTabFlow(TabFlow tabFlow) => Navigator(
      // The key enables us to access the Navigator's state inside the
      // onWillPop callback and for emptying its stack when a tab is
      // re-selected. That is why a GlobalKey is needed instead of
      // a simpler ValueKey.
      key: tabFlow.navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (context) => tabFlow.page,
          ));
}
