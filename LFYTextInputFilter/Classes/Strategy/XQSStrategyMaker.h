//
//  XQSStrategyMaker.h
//  XQSBaseUIKit
//
//  Created by luffy on 2018/6/11.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, XQSStrategyOptions) {
    XQSStrategyOptionName       = 1 << 0, ///< 只能输入中文
    XQSStrategyOptionNumber     = 1 << 1, ///< 只能输入数字
    XQSStrategyOptionCharacter  = 1 << 2, ///< 只能输入字母
    XQSStrategyOptionEmoji      = 1 << 3, ///< 只能输入 emoji
    XQSStrategyOptionWhitespace = 1 << 4, ///< 只能输入空格
    
    XQSStrategyOptionPassword   = XQSStrategyOptionNumber | XQSStrategyOptionCharacter,       ///< 只能输入字母和数字
    XQSStrategyOptionAll        = 1 << 5, ///< 不限制任何输入
};

@interface XQSStrategyMaker : NSObject

+ (XQSStrategyMaker *)maker:(id <UITextInput>)textInput;

- (XQSStrategyMaker *(^)(NSInteger length))lfy_limit;
- (XQSStrategyMaker *(^)(XQSStrategyOptions option))lfy_option;
- (XQSStrategyMaker *)and;

/// 取反
- (XQSStrategyMaker *(^)(void))lfy_inverted;

- (void)install;

@end
