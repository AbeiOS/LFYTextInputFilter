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

- (LFYStrategyMaker *(^)(NSInteger length))lfy_limit;
- (LFYStrategyMaker *(^)(LFYStrategyOptions option))lfy_option;
- (LFYStrategyMaker *)and;

/// 取反
- (LFYStrategyMaker *(^)(void))lfy_inverted;

- (void)install;

@end
