//
//  LFYNameValidStrategy.h
//
//  Created by luffy on 2018/5/28.
//  只能通过中文 UTF8 

#import "LFYBaseValidStrategy.h"

@interface LFYNameValidStrategy : LFYBaseValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput;

@end
