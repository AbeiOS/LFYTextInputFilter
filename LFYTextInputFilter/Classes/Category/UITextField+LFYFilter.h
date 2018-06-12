//
//  UITextField+LFYFilter.h
//  XQSRegLoginModule
//
//  Created by luffy on 2018/5/28.

#import <UIKit/UIKit.h>
#import "XQSTextInputPrivate.h"
#import "XQSStrategyMaker.h"

@interface UITextField (LFYFilter) <XQSTextInputPrivate>
/// 创建过滤对象
- (void)lfy_makeStrategy:(void (NS_NOESCAPE ^)(XQSStrategyMaker *make))block;
/// 过滤方法
- (void)filter;

@end

@interface UITextView (LFYFilter) <XQSTextInputPrivate>
/// 创建过滤对象
- (void)lfy_makeStrategy:(void (NS_NOESCAPE ^)(XQSStrategyMaker *make))block;
/// 过滤方法
- (void)filter;

@end
