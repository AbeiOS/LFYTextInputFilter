//
//  UITextField+LFYFilter.m
//  XQSRegLoginModule
//
//  Created by luffy on 2018/5/28.
//

#import "UITextField+LFYFilter.h"
#import <objc/message.h>
#import "XQSBaseValidStrategy.h"

@implementation UITextField (LFYFilter)

static const void *validKey = @"validKey";

- (void)lfy_makeStrategy:(void (^)(XQSStrategyMaker *))block
{
    XQSStrategyMaker *maker = [XQSStrategyMaker maker:self];
    block(maker);
    [maker install];
}

- (XQSBaseValidStrategy *)validStrategy
{
    id strategy = objc_getAssociatedObject(self, validKey);
    return strategy;
}

- (void)setValidStrategy:(XQSBaseValidStrategy *)validStrategy
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

- (void)lfy_makeStrategy:(void (^)(XQSStrategyMaker *))block
{
    XQSStrategyMaker *maker = [XQSStrategyMaker maker:self];
    block(maker);
    [maker install];
}

- (XQSBaseValidStrategy *)validStrategy
{
    id strategy = objc_getAssociatedObject(self, textViewValidKey);
    return strategy;
}

- (void)setValidStrategy:(XQSBaseValidStrategy *)validStrategy
{
    objc_setAssociatedObject(self, textViewValidKey, validStrategy, OBJC_ASSOCIATION_RETAIN);
}

- (void)filter
{
    [self.validStrategy filterInputView:self];
}

@end

