#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.bruno.Surprise-Me";

/// The "greyColor" asset catalog color resource.
static NSString * const ACColorNameGreyColor AC_SWIFT_PRIVATE = @"greyColor";

/// The "checked" asset catalog image resource.
static NSString * const ACImageNameChecked AC_SWIFT_PRIVATE = @"checked";

/// The "surprise-me-high-resolution-logo-transparent" asset catalog image resource.
static NSString * const ACImageNameSurpriseMeHighResolutionLogoTransparent AC_SWIFT_PRIVATE = @"surprise-me-high-resolution-logo-transparent";

#undef AC_SWIFT_PRIVATE
