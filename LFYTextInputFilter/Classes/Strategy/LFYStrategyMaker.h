//
//  LFYStrategyMaker.h
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/11.
//

#import <Foundation/Foundation.h>
#import "LFYPowerfullStrategy.h"

@interface LFYStrategyMaker : NSObject

+ (LFYStrategyMaker *)maker:(id <UITextInput>)textInput;

/// 输入时限制字数
- (LFYStrategyMaker *(^)(NSInteger length))lfy_limit;
/// 输入时限制字数
- (LFYStrategyMaker *(^)(LFYStrategyLimitLengthModel limitModel))lfy_limitModel;
/// 哪些 option 可输入
- (LFYStrategyMaker *(^)(LFYStrategyOptions option))lfy_option;
/// 输入时增加可用字符串
- (LFYStrategyMaker *(^)(NSString *appendChar))lfy_appendChar;

- (LFYStrategyMaker *)and;

/// 取反
- (LFYStrategyMaker *(^)(void))lfy_inverted;

- (void)install;

@end
