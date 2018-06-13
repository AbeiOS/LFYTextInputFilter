# LFYTextInputFilter
[![Pod version](https://badge.fury.io/co/LFYTextInputFilter.png)](https://badge.fury.io/co/LFYTextInputFilter)
![CocoaPods](https://img.shields.io/cocoapods/dt/LFYTextInputFilter.svg)
[![CI Status](https://img.shields.io/travis/abei_os@126.com/LFYTextInputFilter.svg?style=flat)](https://travis-ci.org/abei_os@126.com/LFYTextInputFilter)
[![Version](https://img.shields.io/cocoapods/v/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)
[![License](https://img.shields.io/cocoapods/l/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)
[![Platform](https://img.shields.io/cocoapods/p/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)

# 只允许中文输入
![image](https://github.com/AbeiOS/LFYTextInputFilter/blob/master/Resource/nameLimit.gif)
# 只允许数字输入
![image](https://github.com/AbeiOS/LFYTextInputFilter/blob/master/Resource/numberLimit.gif)
同时支持多种组合

## 想要你的代码更整洁，只需要两步
1. 创建过滤对象
```
    /// 只能输入数字
    [_textView1 lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(LFYStrategyOptionNumber);
    }];
    
    /// 只能输入字母和数字
    [_textField2 lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(15).lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
    }];
    
    /// 只能输入名称
    [_textField3 lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(LFYStrategyOptionName);
    }];
    
    /// 不能输入空格
    [_textField4 lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(LFYStrategyOptionWhitespace).lfy_inverted();
    }];

```
2. 不同的对象，相同的调用方法
```

#pragma mark - 先设置 Delegate

/// 如果是 textField 先添加通知
- (void)textFieldDidChanged:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    [textField filter];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [textView filter];
}

```

## Requirements

## Installation

LFYTextInputFilter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LFYTextInputFilter'
```

## Author

abei_os@126.com

## License

LFYTextInputFilter is available under the MIT license. See the LICENSE file for more info.
