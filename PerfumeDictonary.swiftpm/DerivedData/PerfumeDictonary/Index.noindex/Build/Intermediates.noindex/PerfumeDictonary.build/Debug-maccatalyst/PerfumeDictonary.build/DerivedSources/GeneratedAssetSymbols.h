#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.Yimkeul.PerfumeDictonary";

/// The "__PresetAccentColor" asset catalog color resource.
static NSString * const ACColorNamePresetAccentColor AC_SWIFT_PRIVATE = @"__PresetAccentColor";

#undef AC_SWIFT_PRIVATE