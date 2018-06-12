//
//  XQSNameValidStrategy.h
//  XQSRegLoginModule
//
//  Created by luffy on 2018/5/28.
//  只能通过中文 UTF8 

#import "XQSBaseValidStrategy.h"

@interface XQSNameValidStrategy : XQSBaseValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput;

@end
