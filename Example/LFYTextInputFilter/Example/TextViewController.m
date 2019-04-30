//
//  TextViewController.m
//  LFYTextInputFilter_Example
//
//  Created by luffy on 2019/4/30.
//  Copyright © 2019 2805508788@qq.com. All rights reserved.
//

#import "TextViewController.h"
#import "ExampleTextViewCell.h"
#import <LFYTextInputFilter/LFYTextInputFilter.h>
#import "DataProvider.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        [self.tableView registerNib:[UINib nibWithNibName:@"ExampleTextViewCell" bundle:nil] forCellReuseIdentifier:@"ExampleTextViewCell"];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.tableView registerNib:[UINib nibWithNibName:@"ExampleTextViewCell" bundle:nil] forCellReuseIdentifier:@"ExampleTextViewCell"];
}

- (void)dealloc
{
    NSLog(@"类 %@ - 被销毁", self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return DataProvider.displayDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleTextViewCell" forIndexPath:indexPath];
    
    NSDictionary *param = DataProvider.displayDatas[indexPath.section];
    NSString *title = param[@"text"];
    LFYStrategyOptions options = [param[@"option"] integerValue];
    BOOL isReverse = [param[@"isReverse"] boolValue];
    
    cell.titleLab.text = title;
    if (indexPath.section == 1) {
        cell.textView.delegate = self;
    }
    else
    {
        cell.textView.delegate = self.view;
    }
    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
        make.lfy_option(options);
        
        if (isReverse)
        {
            make.lfy_inverted();
        }
    }];

//    cell.titleLab.text = @"只能输入数字";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber);
//    }];
//
//    cell.titleLab.text = @"只能输入字母";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionCharacter);
//    }];
//
//    cell.titleLab.text = @"只能输入中文";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionName);
//    }];
//
//    cell.titleLab.text = @"只能输入emoji";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionEmoji);
//    }];
//
//    cell.titleLab.text = @"只能输入特殊字符";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionSpecialChar);
//    }];
//
//    cell.titleLab.text = @"组合：字母+数字";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter);
//    }];
//
//    cell.titleLab.text = @"组合：字母+特殊字符";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionSpecialChar | LFYStrategyOptionCharacter);
//    }];
//
//    cell.titleLab.text = @"组合：数字 + abcd";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber).lfy_appendChar(@"abcd");
//    }];
//
//    cell.titleLab.text = @"组合：数字 + 字母 + \"万有引力\"";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
//    }];
//
//    cell.titleLab.text = @"取反：数字不能输入";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber).lfy_inverted();
//    }];
//
//    cell.titleLab.text = @"取反：数字和字母不能输入";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionNumber | LFYStrategyOptionCharacter).lfy_appendChar(@"万有引力");
//    }];
//
//    cell.titleLab.text = @"取反：中文不能输入";
//    [cell.textView lfy_makeStrategy:^(LFYStrategyMaker *make) {
//        make.lfy_option(LFYStrategyOptionName).lfy_appendChar(@"万有引力");
//    }];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
