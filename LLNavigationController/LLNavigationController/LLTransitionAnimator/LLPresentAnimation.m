//
//  LLWindPresentAnimation.m
//  LLFoundation
//
//  Created by Mr.Wang on 17/1/10.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLPresentAnimation.h"

@interface LLPresentAnimation ()<UIViewControllerAnimatedTransitioning>

@end

@implementation LLPresentAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView transitionFromView:fromView toView:toView duration:duration options:UIViewAnimationOptionTransitionCurlUp  completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
    }];
}

@end
