//
//  FirstViewController.m
//  NavigationBarSwipe
//
//  Created by Boxfish on 17/3/16.
//  Copyright © 2017年 燊燊科技. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
// 启用侧板返回功能
<
UIGestureRecognizerDelegate
>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self addCustomBack];
    // 1.启用侧边返回功能
//    [self enableSideBack];
    
    
    // 2.全屏view返回功能
//    [self enableGlobalBack];
    self.enableGlobalBack = YES;
    NSLog(@"self.enableGlobalBack is %@", @(self.enableGlobalBack));
}

// 添加自定义返回， 但是侧边返回失效
- (void)addCustomBack {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 50, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

// 启用侧边返回功能
- (void)enableSideBack {
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
