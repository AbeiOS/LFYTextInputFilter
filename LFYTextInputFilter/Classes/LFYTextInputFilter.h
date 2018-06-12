
#import "UITextField+LFYFilter"

#pragma mark - 直接使用
/*
 例1: 只能输入10字以内的字母和数字
 
 • make
 self.textView = [UITextView new];
 [self.textView lfy_makeStrategy:^(XQSStrategyMaker *make) {
    make.lfy_limit(10).and.lfy_option(XQSStrategyOptionPassword);
 }];
 
 • then
 - (void)textViewDidChanged:(UITextView *)textView
 {
    [textView filter];
 }
 
 
 例2: 除了空格其他不限制
 
 • make
 self.textView = [UITextView new];
 [self.textView lfy_makeStrategy:^(XQSStrategyMaker *make) {
    make.lfy_limit(10).and.lfy_option(XQSStrategyOptionWhitespace).invered();
 }];

 • then
 - (void)textViewDidChanged:(UITextView *)textView
 {
    [textView filter];
 }
 */

#pragma mark - 如果想新增一种验证
/*
 以新增一个数字验证为例
 方式一 :
 • 新增一个继承 XQSBaseValidStrategy 名称叫 XQSNumberValidStrategy 的子类。
 • 实现 - (void)filterInputView:(id<UITextInput>)textInput 方法，并在方法内调用父类的 filterInputView:validText: 方法，在 block 内 return text.lfy_isValidNumber;
 
 方式二 :
 • 在类 XQSPowerfullStrategy.m 的 filterInputView 添加
 
 if (self.option & XQSStrategyOptionNumber) {
    canInput |= text.lfy_isValidNumber;
 
    if (canInput) {
        return canInput;
    }
 }
 */
