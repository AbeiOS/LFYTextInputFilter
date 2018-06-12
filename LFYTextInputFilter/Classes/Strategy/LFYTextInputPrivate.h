//
//  LFYTextInput.h
//  LFYBaseUIKit
//
//  Created by luffy on 2018/6/12.
//

#import <Foundation/Foundation.h>

@class LFYBaseValidStrategy;

@protocol LFYTextInputPrivate <NSObject>

/// 策略验证基类
@property (nonatomic, strong, readwrite) LFYBaseValidStrategy *validStrategy;

@end
