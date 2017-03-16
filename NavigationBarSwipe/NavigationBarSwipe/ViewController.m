//
//  ViewController.m
//  NavigationBarSwipe
//
//  Created by Boxfish on 17/3/16.
//  Copyright © 2017年 燊燊科技. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"first";
    self.view.backgroundColor = [UIColor redColor];
    [self addButton];
    [self setNavgatioBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavgatioBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self resetNavigationBar];
}

- (void)setNavgatioBar {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)resetNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)addButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 100, 40);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.center = CGPointMake((CGRectGetWidth([UIScreen mainScreen].bounds)-CGRectGetWidth(button.frame))/2.f, (CGRectGetHeight([UIScreen mainScreen].bounds)-CGRectGetHeight(button.frame))/2.f);
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)push {
    FirstViewController *viewController = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
