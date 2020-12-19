#import "NigerianBanksPlugin.h"
#if __has_include(<nigerian_banks/nigerian_banks-Swift.h>)
#import <nigerian_banks/nigerian_banks-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nigerian_banks-Swift.h"
#endif

@implementation NigerianBanksPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNigerianBanksPlugin registerWithRegistrar:registrar];
}
@end
