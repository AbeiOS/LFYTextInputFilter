//
//  NSObject+UITextViewDelegate.h
//  LFYTextInputFilter
//
//  Created by luffy on 2019/4/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UITextViewDelegate)

+ (void)swizzledSelector:(SEL)swizzledSelector originalSelector:(SEL)originalSelector;

- (void)lfy_textViewDidChange:(UITextView *)textView;

@end

NS_ASSUME_NONNULL_END
