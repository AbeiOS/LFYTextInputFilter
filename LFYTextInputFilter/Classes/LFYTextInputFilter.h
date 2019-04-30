
#import "UITextField+LFYFilter.h"

#pragma mark - 直接使用
/*
 例1: 只能输入10字以内的字母和数字
 
 • make
 self.textView = [UITextView new];
 [self.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
    make.lfy_limit(10).and.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
 }];
 
 例2: 除了空格其他不限制
 
 • make
 self.textView = [UITextView new];
 [self.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
    make.lfy_limit(10).and.lfy_option(LFYStrategyOptionWhitespace).invered();
 }];
 
 例3: 可以输入 "，。："和数字
 
 self.textView = [UITextView new];
 [self.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
    make.lfy_limit(10).and.lfy_option(LFYStrategyOptionNumber).appendChar(@"，。：");
 }];
 
 */
