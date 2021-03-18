# universal_navigation

The navigation core for flutter apps. Allows to use bottom navigation and transfer some data between blocs and pages.

## Platform compatibility

Plugin was tested on following platforms:

* Android;
* IOS;
* Windows 10 64 bit;
* Linux (Ubuntu 20.04.1 LTS);
* Web (Chrome).

The support of MacOS is not guaranteed, but you can try to build it.

## Usage

To use this plugin, add `universal_navigation` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Getting Started

Library have dependencies rxdart and get_it, besides, variable *getIt* already initialized inside labrary and and is available for use. For auto generating dependencies we should use [injectable](https://pub.dev/packages/injectable). An example with injectable will be presented below, but you can use only get_it.

## Installation

```yaml
dependencies:
  universal_navigation:
  injectable:

dev_dependencies:
  injectable_generator:
  # of course build_runner is needed to run the injectable generator
  build_runner:
```

## Setup

---
Since the library uses get_it, all dependencies are configured through it using the modular approach.

1. First of all, you should create new file, that's represent global flow pages (or screens, blocs).
```dart
@module
abstract class GlobalFlowsModule {
  @singleton
  GlobalFlows get getGlobalFlows => GlobalFlows({
    StartPage.routeName: (ctx) => getIt<StartPage>(),
    LoginPage.routeName: (ctx) => getIt<LoginPage>(),
    BottomNavigationPage.routeName: (ctx) => getIt<BottomNavigationPage(),
    NestedTabPage.routeName: (ctx) => getIt<NestedTabPage>(),
  });
}
```

Global flows is a module, that contain bundles between id's pages and WidgetBuilder functions. WidgetBuilder function can return page or bloc. GlobalFlows class already define inside lib. Annotations **@module** and **@singleton** are included inside injectable package.
This module should include pages, that meet the following requirements:
* Global pages, that shouldn't be presented with bottom navigation bar;
* BottomNavigationPage, that already included inside lib, but we also must initialized it's dependencies;
* Nested pages, that should be presented with bottom navigation bar, but are not the root of bottom bar items;

2. Create new file that's represent tab flow pages (or screens, blocs).
```dart
@module
abstract class TabFlowsModule {
  @singleton
  List<TabFlow> get getTabFlows => [
        TabFlow(
            page: getIt<FirstTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.mail,
            title: '1'),
        TabFlow(
            page: getIt<SecondTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.announcement,
            title: '2'),
        TabFlow(
            page: getIt<ThirdTabPage>(),
            navigatorKey: GlobalKey<NavigatorState>(),
            iconData: Icons.person,
            title: '3'),
      ];
}
```

Tab flows is a module, that contain list of root bottom bar pages (or blocs). For example, in this project we have three tabs and in TabFlowsModule we also have three TabFlow objects. TabFlow also already define inside lib and have four requirements options:
* page - widget page or bloc;
* navigatorKey - key, that be used for nested navigation on tabs;
* iconData - icon, that will be presented in bottom navigation bar item;
* title - text, that  will be presented in bottom navigation bar item.

Also TabFlow have 5-th parameter - assetImage, that can be used instead of iconData.

3. Create new file that's implement **BottomNavigationBuilder, TabChanger**. BottomNavigationBuilder is interface used by BottomNavigationPage. TabChanger is interface used by AppNavigator for navigation to concrete tab.
```dart
class DefaultBottomNavBridge implements BottomNavigationBuilder, TabChanger {
  final BottomNavKey bottomNavKey;
  final List<TabFlow> tabFlows;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  BottomNavigationBar _bottomNavigationBar;

  DefaultBottomNavBridge({
    @required this.bottomNavKey,
    @required this.tabFlows,
    @required this.backgroundColor,
    @required this.selectedItemColor,
    @required this.unselectedItemColor,
  });

  @override
  Widget build(int currentIndexTab, Function(int) onTabChanged) {
    _bottomNavigationBar = BottomNavigationBar(
      key: bottomNavKey.key,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      currentIndex: currentIndexTab,
      items: tabFlows
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.iconData),
              label: e.title,
            ),
          )
          .toList(),
      onTap: onTabChanged,
    );
    return _bottomNavigationBar;
  }

  @override
  List<TabFlow> getTabFlows() {
    return tabFlows;
  }

  @override
  void onTap(int index) {
    _bottomNavigationBar.onTap(index);
  }
}
```

As already said - BottomNavigationPage already included inside library. This was done to remove boilerplate code, but to preserve the customization of the **BottomNavigationBar**, the BottomNavigationBuilder and TabChanger were introduced. BottomNavigationBuilder have only two methods for overriding - **build** and **getTabFlows**. But inside **build** function you can use any widget and library, the main thing is to set *currentIndexTab, onTabChanged, bottomNavKey* inside your own BottomNavigationBar.  TabChanger have one method for overriding - **onTap **.

**NOTE:** BottomNavKey already defined inside lib. *bottomNavKey* and *tabFlows* are needed dependencies for class, that's implemented **BottomNavigationBuilder, TabChanger**. *tabFlows* - dependency, that we already defined in paragraph 2.

4. Create new file for registering new class **DefaultBottomNavBridge** as type BottomNavigationBuilder, that should be use as dependency for **BottomNavigationPage**.
```dart
@module
abstract class BottomNavBridgeModule {
  @lazySingleton
  DefaultBottomNavBridge get getDefaultBottomNavBridge =>
      DefaultBottomNavBridge(
        bottomNavKey: getIt<BottomNavKey>(),
        tabFlows: getIt<List<TabFlow>>(),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
      );

  BottomNavigationBuilder get getBottomNavigationBuilder =>
      getIt<DefaultBottomNavBridge>();

  TabChanger get getTabChanger => getIt<DefaultBottomNavBridge>();
}
```

5. It's time to merge dependencies from own project and library project. For some reason injectable can't generate dependencies, that represents inside lib - that's why *universal_navigation* used only *get_it* and initiating dependencies split into several methods.  

Creating new file with initialization all dependencies:
```dart
@injectableInit /// annotation injectable 
void configureInjection(String env) {
  ///presented inside library, initializing simple dependencies
  initUNavInjection(env);
  ///shoulde be generated after run: flutter packages pub run build_runner build --delete-conflicting-outputs
  ///contains created dependencies inside current project
  $initGetIt(environment: env);
  ///configure AppNavigator inside library
  initUNavAppNavigatorInjection(env);
  ///registering Bottom Navigation Page with dependencies
  _initBottomNavigationInjection(env);
}

void _initBottomNavigationInjection(String env) {
  getIt.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
      getIt<TabChangeListener>(), getIt<BottomNavigationBuilder>()));
}
```
6. Modification *main.dart*.
```dart
void main() {
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
```

As we see *main.dart* remained simple and clean.

7. Run code generation.

```terminal
flutter packages pub run build_runner watch
```

If you want the generator to run one time and exits use.

```terminal
flutter packages pub run build_runner build
```

After run this command you can see something like this:
```terminal
[LoginPage] depends on unregistered type [NavigationController<dynamic>] from package:universal_navigation/navigation/core/navigation_controller.dart
[StartPage] depends on unregistered type [NavigationController<dynamic>] from package:universal_navigation/navigation/core/navigation_controller.dart
[FirstTabPage] depends on unregistered type [NavigationController<dynamic>] from package:universal_navigation/navigation/core/navigation_controller.dart

```

It's normal, i.e. we register this dependencies with *get_it*, not *injectable*.

## Using navigation and transfer data between pages

---

By default you can use **NavigationController** like this:
```dart
@injectable
class StartPage extends StatefulWidget {
  static const routeName = '/start_page';

  final NavigationController<dynamic> _navigationController;

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
                  onPressed: () {	widget._navigationController.pushGlobalPage(LoginPage.routeName);
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
```

But **NavigationController** have generic, that define type of transfer data between pages (or blocs). If you want to use own type of data you can create something this:
```dart
class EventData {
  final Event event;
  final dynamic data;

  const EventData({
    @required this.event,
    this.data,
  });
}

enum Event {Login, FirstTab}
```
And returning to **paragraph 5-th** you should modify code:
```dart
@injectableInit
void configureInjection(String env) {
///this method also have generic, that define type of transfer data between pages
  initUNavInjection<EventData>(env);
  $initGetIt(getIt, environment: env);
  initUNavAppNavigatorInjection(env);
  _initBottomNavigationInjection(env);
}

void _initBottomNavigationInjection(String env) {
  getIt.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
      getIt<TabChangeListener>(), getIt<BottomNavigationBuilder>()));
}
```

And **StartPage** also should be modified:
```dart
@injectable
class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
  
///Generic type changed
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
widget._navigationController.pushGlobalPage(LoginPage.routeName, eventData: EventData(event: Event.Login, data:'Data From Start Page'));
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
```

But I prefer use [`freezed`](https://pub.dev/packages/freezed) for this purpose. Let's create *EventUnion*:
```dart
part 'event_union.freezed.dart';

@freezed
abstract class EventUnion with _$EventUnion {
  const factory EventUnion() = Empty;
  const factory EventUnion.login({String data}) = Login;
}
```

Run the code generation:
```terminal
flutter packages pub run build_runner build
```

And modifying the files that we changed above.

**StartPage**
```dart
@injectable
class StartPage extends StatefulWidget {
  static const routeName = '/start_page';
///Changed to EventUnion type
  final NavigationController<EventUnion> _navigationController;

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
                    widget._navigationController.pushGlobalPage(LoginPage.routeName, eventData: EventUnion.login(data: 'Data From Start Page'));
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
```

**Injection**
```dart
@injectableInit
void configureInjection(String env) {
///Changed to EventUnion type
  initUNavInjection<EventUnion>(env);
  $initGetIt(getIt, environment: env);
  initUNavAppNavigatorInjection(env);
  _initBottomNavigationInjection(env);
}

void _initBottomNavigationInjection(String env) {
  getIt.registerSingleton<BottomNavigationPage>(BottomNavigationPage(
      getIt<TabChangeListener>(), getIt<BottomNavigationBuilder>()));
}
```
And in the **LoginPage** you can catch data like this:
```dart
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
    widget._navigationController.getStreamEventsData().listen((event) {
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
```

 Full example with navigation global and tab flows you can check by this [link](https://github.com/NikitaMasev/flutter_universal_navigation/tree/main/example).

![demo_navigation](https://user-images.githubusercontent.com/22840281/99361382-0a365a00-28c3-11eb-80f8-77fcb3fb3340.gif)