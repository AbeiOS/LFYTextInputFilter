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
#import "DataProvider.h"

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
    return DataProvider.displayDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleTextFieldCell" forIndexPath:indexPath];
    
    NSDictionary *param = DataProvider.displayDatas[indexPath.section];
    NSString *title = param[@"text"];
    LFYStrategyOptions options = [param[@"option"] integerValue];
    BOOL isReverse = [param[@"isReverse"] boolValue];
    
    cell.titleLab.text = @"组合：字母+数字";
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
    }];
    
    cell.titleLab.text = title;
    [cell.textField lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(options);
        
        if (isReverse)
        {
            make.lfy_inverted();
        }
    }];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
