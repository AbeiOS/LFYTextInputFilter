//
//  LFYPasswordValidStrategy.h
//
//  Created by luffy on 2018/5/28.
//  验证密码的策略类（只能通过数字和字符）

#import "LFYBaseValidStrategy.h"

@interface LFYPasswordValidStrategy : LFYBaseValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput;

@end
