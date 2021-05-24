import 'package:flutter/material.dart';
import 'package:universal_navigation/navigation/core/app_navigator.dart';
import 'package:universal_navigation/navigation/core/bottom_navigation_builder.dart';
import 'package:universal_navigation/navigation/core/tab_change_listener.dart';
import 'package:universal_navigation/navigation/models/navigation_flow_data/tabflow.dart';

/// This was already included to remove boilerplate code, but to preserve the customization of the BottomNavigationBar, the [BottomNavigationBuilder] mixin was introduced.
class BottomNavigationPage extends StatefulWidget {
  ///Identifier of this page.
  static const routeName = '/bottom_navigation';

  ///For notifying [AppNavigator] about changing tab item.
  final TabChangeListener tabChangeNotifier;

  ///For build certain realization of BottomNavigationBar. Also contain list of tab flow (root pages of bottom navigation bar item).
  final BottomNavigationBuilder bottomNavBuilder;

  const BottomNavigationPage(
    this.tabChangeNotifier,
    this.bottomNavBuilder,
  );

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndexTab = 0;
  late TabFlow _currentTabFlow;

  @override
  void initState() {
    ///It's needed for notifying [AppNavigator] about first installed bottom bar item.
    _notifyUpdateTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _currentTabFlow.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndexTab,
          children: widget.bottomNavBuilder
              .getTabFlows()
              .map((tabFlow) => _buildIndexedTabFlow(tabFlow))
              .toList(),
        ),
        bottomNavigationBar:
            widget.bottomNavBuilder.build(_currentIndexTab, _onTabChanged),
      ),
    );
  }

  ///Notifying [AppNavigator] about changing tab. Also changed _currentTabFlow variable.
  void _notifyUpdateTab() {
    _currentTabFlow = widget.bottomNavBuilder.getTabFlows()[_currentIndexTab];
    widget.tabChangeNotifier.notifyTabChanged(_currentTabFlow);
  }

  /// Function that handle click on tab bar item, change _currentIndexTab variable and call [_notifyUpdateTab].
  /// It also resets the stack on the screen on which the item was pressed again.
  void _onTabChanged(int index) {
    setState(() {
      if (_currentIndexTab != index) {
        _currentIndexTab = index;
        _notifyUpdateTab();
      } else {
        _currentTabFlow.navigatorKey.currentState!
            .popUntil((route) => route.isFirst);
      }
    });
  }

  ///Builder function of new page on certain tab bar item.
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
