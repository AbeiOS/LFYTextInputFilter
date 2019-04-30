//
//  ExampleTextViewCell.h
//  LFYTextInputFilter_Example
//
//  Created by luffy on 2019/4/30.
//  Copyright © 2019 2805508788@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleTextViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

NS_ASSUME_NONNULL_END
