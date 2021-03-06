## 0.8.1

* Support null safety.
* Updated *get_it* (7.1.3) and *injectable*(1.4.1) versions.

## 0.7.3

* Updated *get_it* and *injectable* versions.
* Removed bottom navigation key dependency from app navigator.
* Removed implicit dependency of concrete implementation bottom navigation bar from app navigator.
* Updated documentation.
* Making DefaultBottomNavBridge as lazy singleton.

## 0.7.2

* Updated *get_it* and *rxdart* versions.

## 0.7.1

* Added info about platform compatibility.

## 0.7.0

* *Stream<T> getStreamEventsData()* changed to *Stream<T> getEvents()* in **NavigationController**.
* Added new API method *void sinkEvent(T eventData)* in **NavigationController**.

## 0.6.2

* Some code formatting.

## 0.6.1

* Export all imports of library into **universal_navigation.dart**.
* Fix example project.
* Fix web support.

## 0.6.0

* Added support linux (tested on Ubuntu 20.04.1 LTS).

## 0.5.1

* Some code formatting.

## 0.5.0

* Added documentation of **AppNavigator**,**CoreEventNotifier** and **u_nav_configurator.dart** .
* Added support macos, windows and web.

## 0.4.4

* Some code formatting.

## 0.4.3

* Some code formatting.
* Added documentation of  **navigation** package without **AppNavigator**.

## 0.4.2

* Some code formatting.
* Added documentation of  **models** package.

## 0.4.1

* Some code formatting.
* Added documentation of  **BottomNavigationPage**.

## 0.4.0

* Some code formatting.
* Changed condition of method *_buildAdaptivePageRoute* inside **AppNavigator**.

## 0.3.0

* Removed needed dependency *get_it*  for using lib.
* Changed *initUNavInjection* and *initUNavAppNavigatorInjection* functions inside lib.
* Updated example project.
* Updated documentation.

## 0.2.2

* Updated documentation.

## 0.2.1

* Updated demo gif.

## 0.2.0

* Added documentation with examples.

## 0.1.0

* New mixin BottomNavigationBuilder for integration own BottomNavigationBar inside BottomNavigationPage.

## 0.0.8

* Updated example with transfer data using freezed package.

## 0.0.7

* Updated example with transfer data to new page.


## 0.0.6

* Removed dependency injectable from lib.
* Made generic type for events.
* Removed modules from lib.

## 0.0.5

* Initialized part dependencies in core lib.
* User only should create three modules and integrate injectable and get_it.
* Stable API.
* Bottom navigation page already integrated inside lib.

## 0.0.1

* Empty project for core navigation.
