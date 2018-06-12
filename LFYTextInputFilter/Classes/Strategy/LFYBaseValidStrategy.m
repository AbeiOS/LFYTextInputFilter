//
//  LFYBaseValidStrategy.m
//
//  Created by luffy on 2018/5/28.
//

#import "LFYBaseValidStrategy.h"

@implementation LFYBaseValidStrategy

- (instancetype)init
{
    if (self = [super init]) {
        _limit = NSIntegerMax;
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
        
        if ([trimString length] >= self.limit) {
            *stop = YES;
            return ;
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

@end
