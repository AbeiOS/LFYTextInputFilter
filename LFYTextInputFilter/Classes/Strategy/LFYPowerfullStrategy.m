//
//  LFYPowerfullStrategy.m
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/12.
//

#import "LFYPowerfullStrategy.h"
#import "UITextField+LFYFilter.h"

@implementation LFYPowerfullStrategy

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        BOOL canInput = NO;
        
        if (self.option & LFYStrategyOptionNumber)
        {
            canInput |= text.lfy_isValidNumber;
        }
        
        
        if (self.option & LFYStrategyOptionCharacter)
        {
            canInput |= text.lfy_isValidCharacter;
        }
        

        if (self.option & LFYStrategyOptionName)
        {
            canInput |= text.lfy_isValidName;
        }
        
        
        if (self.option & LFYStrategyOptionEmoji)
        {
            canInput |= text.lfy_isValidEmoji;
        }
        
        
        if (self.option & LFYStrategyOptionWhitespace)
        {
            canInput |= text.lfy_isValidWhitespace;
        }
        
        
        if (self.option & LFYStrategyOptionAll)
        {
            canInput |= YES;
        }
        
        
        if (self.appendChar
            && [self.appendChar isKindOfClass:[NSString class]]
            && self.appendChar.length > 0)
        {
            canInput |= [self.appendChar containsString:text];
        }
        
        /// 判断是否取反
        if (self.isInverted)
        {
            canInput = !canInput;
        }
        
        return canInput;
    }];
}

- (void)textDidChanged:(UITextField *)textField
{
    [textField filter];
}

@end
