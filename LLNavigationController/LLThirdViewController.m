//
//  LLThirdViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLThirdViewController.h"

@interface LLThirdViewController ()

@end

@implementation LLThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setRightBtnFrame:CGRectMake(SCREEN_WIDTH-40, 10, 30, 30) image:[[UIImage imageNamed:@"web_load_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)LL_RightBtnItemClick:(UIButton *)rightBtn{
    [GLobalTabBarController setSelectedIndex:1];
}

#pragma - mark 根据颜色创建image
- (UIImage *)getImageWithColor:(UIColor*)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
