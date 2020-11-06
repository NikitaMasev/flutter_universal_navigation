#import "UniversalNavigationPlugin.h"
#if __has_include(<universal_navigation/universal_navigation-Swift.h>)
#import <universal_navigation/universal_navigation-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "universal_navigation-Swift.h"
#endif

@implementation UniversalNavigationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUniversalNavigationPlugin registerWithRegistrar:registrar];
}
@end
