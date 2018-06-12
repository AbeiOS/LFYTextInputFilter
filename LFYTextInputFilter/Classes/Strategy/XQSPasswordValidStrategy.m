//
//  XQSPasswordValidStrategy.m
//  XQSRegLoginModule
//
//  Created by luffy on 2018/5/28.
//

#import "XQSPasswordValidStrategy.h"

@implementation XQSPasswordValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        return [text lfy_isValidCharacterOrNumber];
    }];
}

@end
