//
//  LLNavControllerDelegate.m
//  LLFoundation
//
//  Created by Mr.Wang on 17/1/10.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLNavControllerDelegate.h"

@implementation LLNavControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        if(self.presentTransition){
            Class transition = NSClassFromString(self.presentTransition);
            return [transition new];
        }
    }
    else if (operation == UINavigationControllerOperationPop) {
        if(self.dismissTransition){
            Class transition = NSClassFromString(self.dismissTransition);
            return [transition new];
        }
    }
    return nil;
}

@end
