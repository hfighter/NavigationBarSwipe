//
//  UIViewController+HideNavigationBarBottomLine.h
//  NavigationBarSwipe
//
//  Created by Boxfish on 17/3/16.
//  Copyright © 2017年 燊燊科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HideNavigationBarBottomLine)

- (void)hideNavigationBarBottomLine;
- (UIImageView *)getLineImageViewOfView:(UIView *)view maxHeight:(CGFloat)maxHeight;

@end
