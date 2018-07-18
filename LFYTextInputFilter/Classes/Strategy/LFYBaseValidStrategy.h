//
//  LFYBaseValidStrategy.h
//
//  Created by luffy on 2018/5/28.
//  验证的策略基类 定义了一些方法，但是只能使用它的子类去实现

#import <Foundation/Foundation.h>
#import "NSString+LFYFilter.h"

/// 限制策略
typedef NS_OPTIONS(NSInteger, LFYStrategyOptions) {
    LFYStrategyOptionName       = 1 << 0, ///< 只能输入中文
    LFYStrategyOptionNumber     = 1 << 1, ///< 只能输入数字
    LFYStrategyOptionCharacter  = 1 << 2, ///< 只能输入字母
    LFYStrategyOptionEmoji      = 1 << 3, ///< 只能输入 emoji
    LFYStrategyOptionWhitespace = 1 << 4, ///< 只能输入空格
    
    LFYStrategyOptionPassword   = LFYStrategyOptionNumber | LFYStrategyOptionCharacter,       ///< 只能输入字母和数字
    LFYStrategyOptionAll        = 1 << 5, ///< 不限制任何输入
};

/// 限制字数模式
typedef NS_OPTIONS(NSInteger, LFYStrategyLimitLengthModel) {
    LFYStrategyLimitLengthModelNormal,      ///< 一个中文就是一个长度
    LFYStrategyLimitLengthModelCharacter,   ///< 一个中文等于两个字符长度
};

@interface LFYBaseValidStrategy : NSObject
/// 字数限制
@property (nonatomic, assign) NSInteger limit;
/// 限制长度模式
@property (nonatomic, assign) LFYStrategyLimitLengthModel limitModel;
/// 额外可输入字符串
@property (nonatomic, copy) NSString *appendChar;

#pragma mark - Public Method

/// 过滤方法（子类必须实现该方法）
- (void)filterInputView:(id<UITextInput>)textInput;

#pragma mark - Private Method

/// 子类只需调用，无需关心父类的具体实现
- (void)filterInputView:(id<UITextInput>)textInput
              validText:(BOOL (^)(NSString *text))validHandler;

@end
