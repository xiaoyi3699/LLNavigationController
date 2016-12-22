//
//  LLFirstViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLFirstViewController.h"
#import "TestViewController.h"

@interface LLFirstViewController ()<UITextViewDelegate>
@end

@implementation LLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setRightBtnFrame:CGRectMake(SCREEN_WIDTH-75, 20, 70, 20) Title:@"下一页"];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    GLobalTabBarController.tabBarHidden = NO;
}

- (void)LL_RightBtnItemClick:(UIButton *)rightBtn{
    TestViewController *testVC = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}
@end

