//
//  LFYPowerfullStrategy.h
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/12.
//  万能策略类，该类接受一个策略的 option，这个 option 包含了哪种策略就使用哪种验证类型
//  万能策略类理论上是可以替换掉具体的 LFYBaseValidStrategy 的其他子类。
//  用户可以按照自己的喜好选择继承 LFYBaseValidStrategy 或是修改本类来实现自己的业务

#import "LFYBaseValidStrategy.h"
#import "LFYStrategyMaker.h"

@interface LFYPowerfullStrategy : LFYBaseValidStrategy

/// 策略类型
@property (nonatomic, assign) LFYStrategyOptions option;
/// 是否取反
@property (nonatomic, assign, getter=isInverted) BOOL inverted;

- (void)filterInputView:(id<UITextInput>)textInput;

@end
