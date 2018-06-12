//
//  XQSStrategyMaker.m
//  XQSBaseUIKit
//
//  Created by luffy on 2018/6/11.
//

#import "XQSStrategyMaker.h"
#import "UITextField+LFYFilter.h"
#import "XQSPowerfullStrategy.h"

@interface XQSStrategyMaker ()

/// textInput
@property (nonatomic, strong) id<UITextInput> textInput;
/// 字符数量
@property (nonatomic, assign) NSInteger length;
/// 策略类型
@property (nonatomic, assign) XQSStrategyOptions option;
/// 是否取反
@property (nonatomic, assign, getter=isInverted) BOOL inverted;

@end

@implementation XQSStrategyMaker

+ (XQSStrategyMaker *)maker:(id<UITextInput>)textInput
{
    XQSStrategyMaker *maker = [[XQSStrategyMaker alloc] initWithTextInput:textInput];
    return maker;
}

- (instancetype)initWithTextInput:(id<UITextInput>)textInput
{
    if (self = [super init]) {
        _textInput = textInput;
        _length = CGFLOAT_MAX;
    }
    return self;
}

- (XQSStrategyMaker *(^)(NSInteger))lfy_limit
{
    return ^(NSInteger length) {
        self.length = length;
        return self;
    };
}

- (XQSStrategyMaker *(^)(XQSStrategyOptions))lfy_option
{
    return ^(XQSStrategyOptions option) {
        self.option = option;
        return self;
    };
}

- (void)install
{
    XQSPowerfullStrategy *strategy = [XQSPowerfullStrategy new];
    strategy.option = self.option;
    strategy.limit = self.length;
    strategy.inverted = self.isInverted;
    
    ((UITextField *)self.textInput).validStrategy = strategy;
}

- (XQSStrategyMaker *)and
{
    return self;
}

- (XQSStrategyMaker *(^)(void))lfy_inverted
{
    return ^ {
        self.inverted = YES;
        return self;
    };
}

@end
