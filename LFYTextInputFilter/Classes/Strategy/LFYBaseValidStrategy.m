//
//  LFYBaseValidStrategy.m
//
//  Created by luffy on 2018/5/28.
//

#import "LFYBaseValidStrategy.h"
#import "UITextField+LFYFilter.h"

@implementation LFYBaseValidStrategy

- (instancetype)init
{
    if (self = [super init]) {
        _limit = 1000;
    }
    return self;
}

#pragma mark - Public Method

- (void)filterInputView:(id<UITextInput>)textInput {}

#pragma mark - Private Method

- (void)filterInputView:(id<UITextInput>)textInput
              validText:(BOOL (^)(NSString *))validHandler
{
    UITextRange *markedTextRange = [textInput markedTextRange];
    
    UITextPosition *pos = [textInput positionFromPosition:markedTextRange.start offset:0];
    
    if (markedTextRange && pos) {
        return;
    }
    
    UITextRange *selectedRange = [textInput selectedTextRange];
    
    NSString *orignText = ((UITextField *)textInput).text;
    
    __block NSString *trimString = @"";
    
    [orignText enumerateSubstringsInRange:NSMakeRange(0, orignText.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        if ([self isMaxLength:trimString]) {
            *stop = YES;
            return ;
        }
        
        if ([self isRatherThanMaxLength:[NSString stringWithFormat:@"%@%@", trimString, substring]])
        {
            return;
        }
        
        if (validHandler(substring))
        {
            trimString = [trimString stringByAppendingString:substring];
        }
        
    }];
    
    ((UITextField *)textInput).text = trimString;

    /// 重置光标位置
    NSInteger offset = trimString.length - orignText.length;
    UITextPosition *selectedPosition = [textInput positionFromPosition:selectedRange.start offset:offset];
    
    textInput.selectedTextRange = [textInput textRangeFromPosition:selectedPosition toPosition:selectedPosition];
}
/// 是否到达最大长度
- (BOOL)isMaxLength:(NSString *)text
{
    switch (self.limitModel) {
        case LFYStrategyLimitLengthModelNormal:
            NSLog(@"text = %d %d", text.length, self.limit);
            return text.length >= self.limit;
            
        case LFYStrategyLimitLengthModelCharacter:
            NSLog(@"text = %d %d", text.length, self.limit);
            return text.lfy_numberOfChar >= self.limit;
    }
}

/// 是否超过最大长度
- (BOOL)isRatherThanMaxLength:(NSString *)text
{
    switch (self.limitModel) {
        case LFYStrategyLimitLengthModelNormal:
            return text.length > self.limit;
            
        case LFYStrategyLimitLengthModelCharacter:
            return text.lfy_numberOfChar > self.limit;
    }
}

@end
