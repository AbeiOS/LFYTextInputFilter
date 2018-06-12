//
//  UITextField+LFYFilter.h
//
//  Created by luffy on 2018/5/28.

#import <UIKit/UIKit.h>
#import "LFYTextInputPrivate.h"
#import "LFYStrategyMaker.h"

@interface UITextField (LFYFilter) <LFYTextInputPrivate>
/// 创建过滤对象
- (void)lfy_makeStrategy:(void (NS_NOESCAPE ^)(LFYStrategyMaker *make))block;
/// 过滤方法
- (void)filter;

@end

@interface UITextView (LFYFilter) <LFYTextInputPrivate>
/// 创建过滤对象
- (void)lfy_makeStrategy:(void (NS_NOESCAPE ^)(LFYStrategyMaker *make))block;
/// 过滤方法
- (void)filter;

@end
