//
//  UITextField+LFYFilter.m
//
//  Created by luffy on 2018/5/28.
//

#import "UITextField+LFYFilter.h"
#import <objc/message.h>
#import "LFYBaseValidStrategy.h"
#import "NSObject+UITextViewDelegate.h"

@implementation UITextField (LFYFilter)

static const void *validKey = @"validKey";

- (void)lfy_makeStrategy:(void (NS_NOESCAPE ^)(LFYStrategyMaker *))block
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
    [self addTarget:validStrategy action:NSSelectorFromString(@"textDidChanged:") forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, validKey, validStrategy, OBJC_ASSOCIATION_RETAIN);
}

- (void)filter
{
    [self.validStrategy filterInputView:self];
}

@end


@implementation UITextView (LFYFilter)

static const void *textViewValidKey = @"textViewValidKey";

- (void)setDelegate:(id<UITextViewDelegate>)delegate
{
    [super setDelegate:delegate];
    [delegate.class lfy_swizzledSelector:@selector(lfy_textViewDidChange:) originalSelector:@selector(textViewDidChange:)];
}

- (void)lfy_makeStrategy:(void (NS_NOESCAPE^)(LFYStrategyMaker *))block
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
    if (!self.delegate) {
        self.delegate = validStrategy;
    }
    objc_setAssociatedObject(self, textViewValidKey, validStrategy, OBJC_ASSOCIATION_RETAIN);
}

- (void)filter
{
    [self.validStrategy filterInputView:self];
}

@end

