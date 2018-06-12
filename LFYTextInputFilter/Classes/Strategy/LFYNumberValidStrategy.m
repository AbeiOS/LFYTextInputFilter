//
//  LFYNumberValidStrategy.m
//  LFYBaseUIKit
//
//  Created by luffy on 2018/5/29.
//

#import "LFYNumberValidStrategy.h"

@implementation LFYNumberValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        return text.lfy_isValidNumber;
    }];
}

@end
