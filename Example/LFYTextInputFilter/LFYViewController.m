//
//  LFYViewController.m
//  LFYTextInputFilter
//
//  Created by abei_os@126.com on 06/12/2018.
//  Copyright (c) 2018 abei_os@126.com. All rights reserved.
//

#import "LFYViewController.h"
#import "UITextField+LFYFilter.h"

@interface LFYViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;

@end

@implementation LFYViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"LFYTextInputFilter";
    
    [_textView1 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(XQSStrategyOptionNumber);
    }];
    
    [_textField2 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(15).lfy_option(XQSStrategyOptionNumber | XQSStrategyOptionCharacter);
    }];
    
    [_textField3 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(XQSStrategyOptionName);
    }];
    
    [_textField4 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(XQSStrategyOptionWhitespace).lfy_inverted();
    }];
    
    [_textField5 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(XQSStrategyOptionEmoji);
    }];
    
    [_textField6 lfy_makeStrategy:^(XQSStrategyMaker *make) {
        make.lfy_limit(10).lfy_option(XQSStrategyOptionAll);
    }];
    
    [self builderNotification:_textField2];
    [self builderNotification:_textField3];
    [self builderNotification:_textField4];
    [self builderNotification:_textField5];
    [self builderNotification:_textField6];
}

#pragma mark - Delegate

- (void)textFieldDidChanged:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    [textField filter];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [textView filter];
}

#pragma mark - Private Method

- (void)builderNotification:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
