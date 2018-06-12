#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+LFYFilter.h"
#import "UITextField+LFYFilter.h"
#import "LFYTextInputFilter.h"
#import "XQSBaseValidStrategy.h"
#import "XQSNameValidStrategy.h"
#import "XQSNumberValidStrategy.h"
#import "XQSPasswordValidStrategy.h"
#import "XQSPowerfullStrategy.h"
#import "XQSStrategyMaker.h"
#import "XQSTextInputPrivate.h"

FOUNDATION_EXPORT double LFYTextInputFilterVersionNumber;
FOUNDATION_EXPORT const unsigned char LFYTextInputFilterVersionString[];

