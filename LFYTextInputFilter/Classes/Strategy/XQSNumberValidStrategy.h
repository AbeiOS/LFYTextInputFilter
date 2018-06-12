//
//  XQSNumberValidStrategy.h
//  XQSBaseUIKit
//
//  Created by luffy on 2018/5/29.
//  只能通过数字

#import "XQSBaseValidStrategy.h"

@interface XQSNumberValidStrategy : XQSBaseValidStrategy

- (void)filterInputView:(id<UITextInput>)textInput;

@end
