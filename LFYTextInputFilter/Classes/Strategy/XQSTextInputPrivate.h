//
//  XQSTextInput.h
//  XQSBaseUIKit
//
//  Created by luffy on 2018/6/12.
//

#import <Foundation/Foundation.h>

@class XQSBaseValidStrategy;

@protocol XQSTextInputPrivate <NSObject>

/// 策略验证基类
@property (nonatomic, strong, readwrite) XQSBaseValidStrategy *validStrategy;

@end
