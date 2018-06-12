//
//  UITextField+LFYFilter.m
//
//  Created by luffy on 2018/5/28.
//

#import "UITextField+LFYFilter.h"
#import <objc/message.h>
#import "LFYBaseValidStrategy.h"

@implementation UITextField (LFYFilter)

static const void *validKey = @"validKey";

- (void)lfy_makeStrategy:(void (^)(LFYStrategyMaker *))block
{
    LFYStrategyMaker *maker = [LFYStrategyMaker maker:self];
    block(maker);
    [maker install];
}

- (LFYBaseValidStrategy *)validStrategy
{
    id strategy = objc_getAssociatedObject(self, validKey);
    return strategy;
}

- (void)setValidStrategy:(LFYBaseValidStrategy *)validStrategy
{
    objc_setAssociatedObject(self, validKey, validStrategy, OBJC_ASSOCIATION_RETAIN);
}

- (void)filter
{
    [self.validStrategy filterInputView:self];
}

@end


@implementation UITextView (LFYFilter)

static const void *textViewValidKey = @"textViewValidKey";

- (void)lfy_makeStrategy:(void (^)(LFYStrategyMaker *))block
{
    LFYStrategyMaker *maker = [LFYStrategyMaker maker:self];
    block(maker);
    [maker install];
}

- (LFYBaseValidStrategy *)validStrategy
{
    id strategy = objc_getAssociatedObject(self, textViewValidKey);
    return strategy;
}

- (void)setValidStrategy:(LFYBaseValidStrategy *)validStrategy
{
    objc_setAssociatedObject(self, textViewValidKey, validStrategy, OBJC_ASSOCIATION_RETAIN);
}

- (void)filter
{
    [self.validStrategy filterInputView:self];
}

@end

