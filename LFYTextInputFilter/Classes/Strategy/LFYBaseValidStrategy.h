//
//  LFYBaseValidStrategy.h
//
//  Created by luffy on 2018/5/28.
//  验证的策略基类 定义了一些方法，但是只能使用它的子类去实现

#import <Foundation/Foundation.h>
#import "NSString+LFYFilter.h"

@interface LFYBaseValidStrategy : NSObject
/// 字数限制
@property (nonatomic, assign) NSInteger limit;
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
