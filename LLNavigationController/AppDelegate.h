//
//  AppDelegate.h
//  LLNavigationController
//
//  Created by Mr.Wang on 16/12/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLScreenShotView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) LLScreenShotView *screenShotView;

+ (instancetype)shareDelegete;

@end

