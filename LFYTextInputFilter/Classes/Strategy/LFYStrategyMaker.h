//
//  LFYStrategyMaker.h
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/11.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, LFYStrategyOptions) {
    LFYStrategyOptionName       = 1 << 0, ///< 只能输入中文
    LFYStrategyOptionNumber     = 1 << 1, ///< 只能输入数字
    LFYStrategyOptionCharacter  = 1 << 2, ///< 只能输入字母
    LFYStrategyOptionEmoji      = 1 << 3, ///< 只能输入 emoji
    LFYStrategyOptionWhitespace = 1 << 4, ///< 只能输入空格
    
    LFYStrategyOptionPassword   = LFYStrategyOptionNumber | LFYStrategyOptionCharacter,       ///< 只能输入字母和数字
    LFYStrategyOptionAll        = 1 << 5, ///< 不限制任何输入
};

@interface LFYStrategyMaker : NSObject

+ (LFYStrategyMaker *)maker:(id <UITextInput>)textInput;

/// 输入时限制字数
- (LFYStrategyMaker *(^)(NSInteger length))lfy_limit;
/// 哪些 option 可输入
- (LFYStrategyMaker *(^)(LFYStrategyOptions option))lfy_option;
/// 输入时增加可用字符串
- (LFYStrategyMaker *(^)(NSString *appendChar))lfy_appendChar;

- (LFYStrategyMaker *)and;

/// 取反
- (LFYStrategyMaker *(^)(void))lfy_inverted;

- (void)install;

@end
