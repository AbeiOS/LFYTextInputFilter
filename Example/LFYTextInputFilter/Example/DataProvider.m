//
//  DataProvider.m
//  LFYTextInputFilter_Example
//
//  Created by luffy on 2019/4/30.
//  Copyright © 2019 2805508788@qq.com. All rights reserved.
//

#import "DataProvider.h"
#import <LFYTextInputFilter/LFYTextInputFilter.h>

@implementation DataProvider

+ (NSArray *)displayDatas
{
    //        cell.titleLab.text = @"只能输入数字";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber);
    //        }];
    //
    //        cell.titleLab.text = @"只能输入字母";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionCharacter);
    //        }];
    //
    //        cell.titleLab.text = @"只能输入中文";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionName);
    //        }];
    //
    //        cell.titleLab.text = @"只能输入emoji";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionEmoji);
    //        }];
    //
    //        cell.titleLab.text = @"只能输入特殊字符";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionSpecialChar);
    //        }];
    //
    //        cell.titleLab.text = @"组合：字母+数字";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
    //        }];
    //
    //        cell.titleLab.text = @"组合：字母+特殊字符";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionSpecialChar | LFYStrategyOptionCharacter);
    //        }];
    //
    //        cell.titleLab.text = @"组合：数字 + abcd";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber).lfy_appendChar(@"abcd");
    //        }];
    //
    //        cell.titleLab.text = @"组合：数字 + 字母 + \"万有引力\"";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
    //        }];
    //
    //        cell.titleLab.text = @"取反：数字不能输入";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber).lfy_inverted();
    //        }];
    //
    //        cell.titleLab.text = @"取反：数字和字母不能输入";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
    //        }];
    //
    //        cell.titleLab.text = @"取反：中文不能输入";
    //        [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
    //            make.lfy_option(LFYStrategyOptionName).lfy_appendChar(@"万有引力");
    //        }];
    
    return @[
             @{
                 @"text": @"只能输入数字",
                 @"option": @(LFYStrategyOptionNumber),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"只能输入字母",
                 @"option": @(LFYStrategyOptionCharacter),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"只能输入中文",
                 @"option": @(LFYStrategyOptionName),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"只能输入emoji",
                 @"option": @(LFYStrategyOptionEmoji),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"只能输入特殊字符",
                 @"option": @(LFYStrategyOptionSpecialChar),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"组合：字母+数字",
                 @"option": @(LFYStrategyOptionCharacter | LFYStrategyOptionNumber),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"组合：字母+特殊字符",
                 @"option": @(LFYStrategyOptionCharacter | LFYStrategyOptionSpecialChar),
                 @"isReverse": @(false),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"组合：数字 + abcd",
                 @"option": @(LFYStrategyOptionNumber),
                 @"isReverse": @(false),
                 @"extraStr": @"abcd",
                 },
             @{
                 @"text": @"组合：数字 + 字母 + 万有引力",
                 @"option": @(LFYStrategyOptionNumber | LFYStrategyOptionCharacter),
                 @"isReverse": @(false),
                 @"extraStr": @"万有引力",
                 },
             @{
                 @"text": @"取反：数字不能输入",
                 @"option": @(LFYStrategyOptionNumber),
                 @"isReverse": @(true),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"取反：数字和字母不能输入",
                 @"option": @(LFYStrategyOptionNumber | LFYStrategyOptionCharacter),
                 @"isReverse": @(true),
                 @"extraStr": @"",
                 },
             @{
                 @"text": @"取反：中文不能输入",
                 @"option": @(LFYStrategyOptionName),
                 @"isReverse": @(true),
                 @"extraStr": @"",
                 },
             ];
}

@end
