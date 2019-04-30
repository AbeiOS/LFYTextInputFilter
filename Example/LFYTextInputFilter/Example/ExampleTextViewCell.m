//
//  ExampleTextViewCell.m
//  LFYTextInputFilter_Example
//
//  Created by luffy on 2019/4/30.
//  Copyright © 2019 2805508788@qq.com. All rights reserved.
//

#import "ExampleTextViewCell.h"

@implementation ExampleTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
