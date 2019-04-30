//
//  LFYViewController.m
//  LFYTextInputFilter
//
//  Created by abei_os@126.com on 06/12/2018.
//  Copyright (c) 2018 abei_os@126.com. All rights reserved.
//

#import "TextFieldController.h"
#import "ExampleTextFieldCell.h"
#import <LFYTextInputFilter/LFYTextInputFilter.h>

@interface TextFieldController () <UITextViewDelegate>

/// <##>
@property (nonatomic, strong) NSArray *displayDatas;

@end

@implementation TextFieldController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        [self.tableView registerNib:[UINib nibWithNibName:@"ExampleTextFieldCell" bundle:nil] forCellReuseIdentifier:@"ExampleTextFieldCell"];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ExampleTextFieldCell" bundle:nil] forCellReuseIdentifier:@"ExampleTextFieldCell"];
}

- (void)dealloc
{
    NSLog(@"类 %@ - 被销毁", self.class);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.displayDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleTextFieldCell" forIndexPath:indexPath];
    
    cell.titleLab.text = @"只能输入数字";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber);
    }];
    
    cell.titleLab.text = @"只能输入字母";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionCharacter);
    }];
    
    cell.titleLab.text = @"只能输入中文";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionName);
    }];
    
    cell.titleLab.text = @"只能输入emoji";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionEmoji);
    }];

    cell.titleLab.text = @"只能输入特殊字符";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionSpecialChar);
    }];

    cell.titleLab.text = @"组合：字母+数字";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
    }];
    
    cell.titleLab.text = @"组合：字母+特殊字符";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionSpecialChar | LFYStrategyOptionCharacter);
    }];
    
    cell.titleLab.text = @"组合：数字 + abcd";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber).lfy_appendChar(@"abcd");
    }];
    
    cell.titleLab.text = @"组合：数字 + 字母 + \"万有引力\"";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
    }];
    
    cell.titleLab.text = @"取反：数字不能输入";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber).lfy_inverted();
    }];
    
    cell.titleLab.text = @"取反：数字和字母不能输入";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
    }];
    
    cell.titleLab.text = @"取反：中文不能输入";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionName).lfy_appendChar(@"万有引力");
    }];
    // Configure the cell...
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)displayDatas
{
    if (!_displayDatas) {
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

        _displayDatas = @[
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
                              @"extraStr": @"",
                              },
                          @{
                              @"text": @"组合：数字 + 字母 + \"万有引力\"",
                              @"option": @(3),
                              @"isReverse": @(false),
                              @"extraStr": @"",
                              },
                          @{
                              @"text": @"取反：数字不能输入",
                              @"option": @(3),
                              @"isReverse": @(false),
                              @"extraStr": @"",
                              },
                          @{
                              @"text": @"取反：数字和字母不能输入",
                              @"option": @(3),
                              @"isReverse": @(false),
                              @"extraStr": @"",
                              },
                          @{
                              @"text": @"取反：中文不能输入",
                              @"option": @(3),
                              @"isReverse": @(false),
                              @"extraStr": @"",
                              },
                          ];
    }
    return _displayDatas;
}

@end
