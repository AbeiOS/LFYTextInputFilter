//
//  LFYNumberValidStrategy.h
//  LFYBaseUIKit
//
//  Created by luffy on 2018/5/29.
//  只能通过数字

#import "LFYBaseValidStrategy.h"

@interface LFYNumberValidStrategy : LFYBaseValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput;

@end
