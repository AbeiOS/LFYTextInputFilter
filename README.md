# LFYTextInputFilter
[![Pod version](https://badge.fury.io/co/LFYTextInputFilter.png)](https://badge.fury.io/co/LFYTextInputFilter)
![CocoaPods](https://img.shields.io/cocoapods/dt/LFYTextInputFilter.svg)
[![CI Status](https://img.shields.io/travis/abei_os@126.com/LFYTextInputFilter.svg?style=flat)](https://travis-ci.org/abei_os@126.com/LFYTextInputFilter)
[![Version](https://img.shields.io/cocoapods/v/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)
[![License](https://img.shields.io/cocoapods/l/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)
[![Platform](https://img.shields.io/cocoapods/p/LFYTextInputFilter.svg?style=flat)](https://cocoapods.org/pods/LFYTextInputFilter)

## 只允许中文输入
![image](https://github.com/AbeiOS/LFYTextInputFilter/blob/master/Resource/nameLimit.gif)
## 只允许数字输入
![image](https://github.com/AbeiOS/LFYTextInputFilter/blob/master/Resource/numberLimit.gif)
## 同时支持多种组合

## 创建简单，无需添加代理
```
    /// 只能输入字母和数字 
    [_textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(15).lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
    }];
    
    /// 不能输入空格
    [_textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(LFYStrategyOptionWhitespace).lfy_inverted();
    }];
```


## Requirements
iOS 8.0
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
