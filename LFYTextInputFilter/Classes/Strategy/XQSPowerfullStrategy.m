//
//  XQSPowerfullStrategy.m
//  XQSBaseUIKit
//
//  Created by luffy on 2018/6/12.
//

#import "XQSPowerfullStrategy.h"

@implementation XQSPowerfullStrategy

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        BOOL canInput = NO;
        
        if (self.option & XQSStrategyOptionNumber)
        {
            canInput |= text.lfy_isValidNumber;
        }
        
        
        if (self.option & XQSStrategyOptionCharacter)
        {
            canInput |= text.lfy_isValidCharacter;
        }
        

        if (self.option & XQSStrategyOptionName)
        {
            canInput |= text.lfy_isValidName;
        }
        
        
        if (self.option & XQSStrategyOptionEmoji)
        {
            canInput |= text.lfy_isValidEmoji;
        }
        
        
        if (self.option & XQSStrategyOptionWhitespace)
        {
            canInput |= text.lfy_isValidWhitespace;
        }
        
        
        if (self.option & XQSStrategyOptionAll)
        {
            canInput |= YES;
        }
        
        
        /// 判断是否取反
        if (self.isInverted)
        {
            canInput = !canInput;
        }
        
        return canInput;
    }];
}

@end
