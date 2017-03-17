//
//UINavigationBar+Shade.m
//NavigationBarSwipe
//
//Created by Boxfish on 17/3/17.
//Copyright © 2017年 燊燊科技. All rights reserved.
//

#import "UINavigationBar+Shade.h"
#import <objc/runtime.h>

static char shadeViewKey;

@implementation UINavigationBar (Shade)

- (UIView *)shadeView {
    return objc_getAssociatedObject(self, &shadeViewKey);
}


- (void)setShadeView:(UIView *)shadeView {
    objc_setAssociatedObject(self, &shadeViewKey, shadeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)shade_setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.shadeView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.shadeView.userInteractionEnabled = NO;
        [[self.subviews firstObject] insertSubview:self.shadeView atIndex:0];
    }
    
    self.shadeView.backgroundColor = backgroundColor;
}


- (void)shade_setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}


- (void)shade_setElementsAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
        }
        
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
            obj.alpha = alpha;
        }
    }];
}


- (void)shade_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.shadeView removeFromSuperview];
    self.shadeView = nil;
}


@end
