//
//  LFYStrategyMaker.m
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/11.
//

#import "LFYStrategyMaker.h"
#import "UITextField+LFYFilter.h"

@interface LFYStrategyMaker ()

/// textInput
@property (nonatomic, strong) id<UITextInput> textInput;
/// 字符数量
@property (nonatomic, assign) NSInteger length;
/// 字符数量
@property (nonatomic, assign) LFYStrategyLimitLengthModel limitModel;
/// 策略类型
@property (nonatomic, assign) LFYStrategyOptions option;
/// 可输入字符串
@property (nonatomic, copy) NSString *appendChar;
/// 是否取反
@property (nonatomic, assign, getter=isInverted) BOOL inverted;

@end

@implementation LFYStrategyMaker

+ (LFYStrategyMaker *)maker:(id<UITextInput>)textInput
{
    LFYStrategyMaker *maker = [[LFYStrategyMaker alloc] initWithTextInput:textInput];
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

- (LFYStrategyMaker *(^)(NSInteger))lfy_limit
{
    return ^(NSInteger length) {
        self.length = length;
        return self;
    };
}

- (LFYStrategyMaker *(^)(LFYStrategyLimitLengthModel))lfy_limitModel
{
    return ^(LFYStrategyLimitLengthModel limitModel) {
        self.limitModel = limitModel;
        return self;
    };
}

- (LFYStrategyMaker *(^)(LFYStrategyOptions))lfy_option
{
    return ^(LFYStrategyOptions option) {
        self.option = option;
        return self;
    };
}

- (LFYStrategyMaker *(^)(NSString *appendChar))lfy_appendChar;
{
    return ^(NSString *appendChar) {
        self.appendChar = appendChar;
        return self;
    };
}

- (void)install
{
    LFYPowerfullStrategy *strategy = [LFYPowerfullStrategy new];
    strategy.option = self.option;
    strategy.limit = self.length;
    strategy.inverted = self.isInverted;
    strategy.limitModel = self.limitModel;
    /// 策略的可选属性
    if (self.appendChar)
    {
        strategy.appendChar = self.appendChar;
    }
    
    ((UITextField *)self.textInput).validStrategy = strategy;
}

- (LFYStrategyMaker *)and
{
    return self;
}

- (LFYStrategyMaker *(^)(void))lfy_inverted
{
    return ^ {
        self.inverted = YES;
        return self;
    };
}

@end
