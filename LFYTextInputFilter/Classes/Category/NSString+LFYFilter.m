//
//  NSString+LFYFilter.m
//  xiaoqishen
//
//  Created by 金泉斌 on 2017/6/27.
//  Copyright © 2017年 xiaoyuxiaoyu. All rights reserved.
//

#import "NSString+LFYFilter.h"

typedef void (^EnumerateSubstringsBlock)(NSString * _Nullable substring,
                                         NSRange substringRange,
                                         NSRange enclosingRange,
                                         BOOL *stop);

@implementation NSString (LFYFilter)

- (BOOL)lfy_isValidEmoji
{
    __block BOOL containsEmoji = NO;
    
   EnumerateSubstringsBlock block = ^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop)
    {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff)
        {
            if (substring.length > 1)
            {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f918)
                {
                    containsEmoji = YES;
                }
            }
        }
        else if (substring.length > 1)
        {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3 || ls == 0xFE0F || ls == 0xd83c)
            {
                containsEmoji = YES;
            }
        }
        else
        {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff)
            {
                if (0x278b <= hs && 0x2792 >= hs)
                {
                    containsEmoji = NO;
                }
                else
                {
                    containsEmoji = YES;
                }
            }
            else if (0x2B05 <= hs && hs <= 0x2b07)
            {
                containsEmoji = YES;
            }
            else if (0x2934 <= hs && hs <= 0x2935)
            {
                containsEmoji = YES;
            }
            else if (0x3297 <= hs && hs <= 0x3299)
            {
                containsEmoji = YES;
            }
            else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0xd83e)
            {
                containsEmoji = YES;
            }
        }
   };
    
    [self
     enumerateSubstringsInRange:NSMakeRange(0, [self length])
     options:NSStringEnumerationByComposedCharacterSequences
     usingBlock:block];
    
    return containsEmoji;
}

#pragma mark - 单个字符的确认

- (BOOL)lfy_isValidUTF8
{
    static NSPredicate *utf8Predicate;
    if (!utf8Predicate) {
        utf8Predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[\u4E00-\u9FA5]+$"];
    }
    return [utf8Predicate evaluateWithObject:self];
}

- (BOOL)lfy_isValidNumber
{
    static NSPredicate *utf8Predicate;
    if (!utf8Predicate) {
        utf8Predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]+$"];
    }
    return [utf8Predicate evaluateWithObject:self];
}

- (BOOL)lfy_isValidCharacter
{
    static NSPredicate *characterPredicate;
    if (!characterPredicate) {
        characterPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-zA-Z]+$"];
    }
    
    return [characterPredicate evaluateWithObject:self];
}

- (BOOL)lfy_isValidCharacterOrNumber
{
    static NSPredicate *characterOrNumberPredicate;
    if (!characterOrNumberPredicate) {
        characterOrNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-zA-Z0-9]+$"];
    }
    
    return [characterOrNumberPredicate evaluateWithObject:self];
}

- (BOOL)lfy_isValidMobile {
    NSString * pattern = @"^((\\+86)|(86))?1[3-9][\\d]{9}$";
    return [self matchPatternString:pattern];
}

- (BOOL)lfy_isValidName
{
    BOOL isMatch = self.lfy_isValidUTF8 || ([@"➋➌➍➎➏➐➑➒" rangeOfString:self].location != NSNotFound);
    return isMatch;
}

- (BOOL)lfy_isValidWhitespace
{
    static NSPredicate *whitespacePredicate;
    if (!whitespacePredicate) {
        whitespacePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[ ]+$"];
    }
    
    return [whitespacePredicate evaluateWithObject:self];
}

- (int)lfy_numberOfChar
{
    NSString *pattern = @"[\u4e00-\u9fa5]";
    NSRegularExpression * regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray * result = [regex matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    return  (int)self.length + (int)result.count;

}

#pragma mark - Private Method

- (BOOL)matchPatternString:(NSString *)pattern {
    NSRegularExpression * regex = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray * results = [regex matchesInString:self
                                       options:NSMatchingReportProgress
                                         range:NSMakeRange(0, self.length)];
    
    return results.count;
}

@end
