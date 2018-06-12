//
//  LFYPasswordValidStrategy.m
//
//  Created by luffy on 2018/5/28.
//

#import "LFYPasswordValidStrategy.h"

@implementation LFYPasswordValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        return [text lfy_isValidCharacterOrNumber];
    }];
}

@end
