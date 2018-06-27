//
//  NSString+LFYFilter.h
//
//  Created by luffy on 2018/5/28.
//

#import <Foundation/Foundation.h>

@interface NSString (LFYFilter)

/**
 * 是否包含emoji
 */
- (BOOL)lfy_isValidEmoji;

/**
 手机号正则
 
 @return 是否为手机号 1 打头的
 */
- (BOOL)lfy_isValidMobile;

#pragma mark - 单个字符的正则
/**
 单个字符是否为名称

 @return BOOL
 */
- (BOOL)lfy_isValidName;

/**
 单个字符是否为纯数字

 @return BOOL
 */
- (BOOL)lfy_isValidNumber;

/**
 单个字符是否为字母

 @return BOOL
 */
- (BOOL)lfy_isValidCharacter;

/**
 单个字符是否为数字或者字母

 @return BOOL
 */
- (BOOL)lfy_isValidCharacterOrNumber;

/**
 只能输入空格

 @return BOOL
 */
- (BOOL)lfy_isValidWhitespace;

@end
