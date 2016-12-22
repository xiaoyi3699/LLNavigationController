//
//  LLThirdViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLThirdViewController.h"
#import "LLWebViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface LLThirdViewController ()

@end

@implementation LLThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setRightBtnFrame:CGRectMake(SCREEN_WIDTH-45, 20, 40, 20) Title:@"html"];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)LLRightBtnItemClick:(UIButton *)rightBtn{
    LLWebViewController *htmlVC = [[LLWebViewController alloc] initWithHtmlFileName:@"index1" title:@"我的html"];
    [self.navigationController pushViewController:htmlVC animated:YES];
}

@end
