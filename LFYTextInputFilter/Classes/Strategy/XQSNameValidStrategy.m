//
//  XQSNameValidStrategy.m
//  XQSRegLoginModule
//
//  Created by luffy on 2018/5/28.
//

#import "XQSNameValidStrategy.h"
#import "NSString+LFYFilter.h"

@implementation XQSNameValidStrategy

- (instancetype)init
{
    if (self = [super init]) {
        self.limit = 6;
    }
    return self;
}

- (void)filterInputView:(id<UITextInput>)textInput
{
    [self filterInputView:textInput validText:^BOOL(NSString *text) {
        return text.lfy_isValidName;
    }];
}

@end
