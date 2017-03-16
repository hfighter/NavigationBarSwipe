//
//  UIViewController+HideNavigationBarBottomLine.m
//  NavigationBarSwipe
//
//  Created by Boxfish on 17/3/16.
//  Copyright © 2017年 燊燊科技. All rights reserved.
//

#import "UIViewController+HideNavigationBarBottomLine.h"

@implementation UIViewController (HideNavigationBarBottomLine)

- (UIImageView *)getLineImageViewOfView:(UIView *)view maxHeight:(CGFloat)maxHeight {
    if ([view isKindOfClass:UIImageView.class] && (view.bounds.size.height <= maxHeight)) {
        return (UIImageView *)view;
    }

    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self getLineImageViewOfView:subview maxHeight:maxHeight];

        if (imageView) {
            return imageView;
        }
    }

    return nil;
}

// 隐藏导航栏黑线
- (void)hideNavigationBarBottomLine {
    UIImageView *imageView = [self getLineImageViewOfView:self.navigationController.navigationBar maxHeight:1.0f];
    imageView.hidden = YES;
}

@end
