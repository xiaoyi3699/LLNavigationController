//
//  TestViewController.m
//  LLNavigationController
//
//  Created by Mr.Wang on 16/12/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    GLobalTabBarController.tabBarHidden = YES;
}

@end
