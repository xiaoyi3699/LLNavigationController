//
//  UIViewController+LLNavController.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/12/2.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LLNavController)

//导航栏左侧按钮点击事件
- (void)LL_LeftBtnItemClick:(UIButton *)leftBtn;

//导航栏右侧按钮点击事件
- (void)LL_RightBtnItemClick:(UIButton *)rightBtn;

@end
