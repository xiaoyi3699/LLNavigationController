//
//  LLSecondViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [NSString stringWithFormat:@"第%ld页",self.navigationController.viewControllers.count];
    
    [self createViews];
}

- (void)createViews{
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"继续" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)rightBarButtonItem{
    ViewController *secondVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}


@end
