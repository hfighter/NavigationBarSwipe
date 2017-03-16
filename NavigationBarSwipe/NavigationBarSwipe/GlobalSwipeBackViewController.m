//
//  GlobalSwipeBackViewController.m
//  NavigationBarSwipe
//
//  Created by Boxfish on 17/3/16.
//  Copyright © 2017年 燊燊科技. All rights reserved.
//

#import "GlobalSwipeBackViewController.h"

@interface GlobalSwipeBackViewController ()
<
UIGestureRecognizerDelegate
>

@end

@implementation GlobalSwipeBackViewController
{
    UIPanGestureRecognizer *_panGesture;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enableGlobalBack = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setEnableGlobalBack:(BOOL)enableGlobalBack {
    _enableGlobalBack = enableGlobalBack;
    if (enableGlobalBack) {
        [self enableGlobalBackAction];
    } else {
        [self disableGlobalBackAction];
    }
}

// 全屏滑动返回
- (void)enableGlobalBackAction {
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    }
    _panGesture.delegate = self;
    [self.view addGestureRecognizer:_panGesture];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)disableGlobalBackAction {
    _panGesture.delegate = nil;
    _panGesture = nil;
}

@end
