//
//  NSObject+UITextViewDelegate.m
//  LFYTextInputFilter
//
//  Created by luffy on 2019/4/30.
//

#import "NSObject+UITextViewDelegate.h"
#import <objc/message.h>
#import "UITextField+LFYFilter.h"

@implementation NSObject (UITextViewDelegate)

+ (void)swizzledSelector:(SEL)swizzledSelector originalSelector:(SEL)originalSelector
{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)lfy_textViewDidChange:(UITextView *)textView {
    [textView filter];
    
    if ([self respondsToSelector:@selector(lfy_textViewDidChange:)]) {
        [self lfy_textViewDidChange:textView];
    }
}

@end
