//
//  LFYViewController.m
//  LFYTextInputFilter
//
//  Created by abei_os@126.com on 06/12/2018.
//  Copyright (c) 2018 abei_os@126.com. All rights reserved.
//

#import "TextFieldController.h"

@interface TextFieldController () <UITextViewDelegate>

@end

@implementation TextFieldController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
