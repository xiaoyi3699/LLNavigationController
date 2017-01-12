//
//  LLBaseNavigationController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/9/3.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLBaseNavigationController.h"
#import "LLNavControllerDelegate.h"

@interface LLBaseNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray<UIImage *> *childVCImages; //保存截屏的数组
@property (nonatomic, strong) LLNavControllerDelegate   *transitionDelagate;

@end

@implementation LLBaseNavigationController

- (void)loadView{
    [super loadView];
    //self.interactivePopGestureRecognizer.delegate = self; //系统的返回手势代理
    self.interactivePopGestureRecognizer.enabled = NO;      //屏蔽系统的返回手势
    
    self.transitionDelagate = [[LLNavControllerDelegate alloc] init];
    self.transitionDelagate.presentTransition = @"LLPresentAnimation"; //自定义push动画
    self.transitionDelagate.dismissTransition = @"LLDismissAnimation"; //自定义pop动画
    self.delegate = self.transitionDelagate;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragging:)];
    popRecognizer.delegate = self;
    [self.view addGestureRecognizer:popRecognizer];         //自定义的滑动返回手势
    self.popRecognizerEnable = YES;                         //默认相应自定义的滑动返回手势
}

#pragma mark - 重写父类方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        [self createScreenShot];
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    [self.childVCImages removeLastObject];
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSArray *viewControllers = [super popToViewController:viewController animated:animated];
    if (self.childVCImages.count >= viewControllers.count){
        for (int i = 0; i < viewControllers.count; i++) {
            [self.childVCImages removeLastObject];
        }
    }
    return viewControllers;
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    [self.childVCImages removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

- (void)dragging:(UIPanGestureRecognizer *)recognizer{
    //如果只有1个子控制器,停止拖拽
    if (self.viewControllers.count <= 1) return;
    //在x方向上移动的距离
    CGFloat tx = [recognizer translationInView:self.view].x;
    //在x方向上移动的距离除以屏幕的宽度
    CGFloat width_scale;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        //添加截图到最后面
        width_scale = 0;
        GLobalTabBarController.screenShotView.hidden = NO;
        GLobalTabBarController.screenShotView.maskView.alpha = 0.5;
        GLobalTabBarController.screenShotView.imageView.image = [self.childVCImages lastObject];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged){
        //移动view
        if (tx>10) {
            width_scale = (tx-10)/self.view.bounds.size.width;
            self.view.transform = CGAffineTransformMakeTranslation(tx-10, 0);
            GLobalTabBarController.screenShotView.maskView.alpha = 0.5-width_scale*0.5;
        }
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        //决定pop还是还原
        CGFloat x = [recognizer translationInView:self.view].x;
        if (x >= 100) {
            [UIView animateWithDuration:0.25 animations:^{
                GLobalTabBarController.screenShotView.maskView.alpha = 0;
                self.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                GLobalTabBarController.screenShotView.hidden = YES;
                self.view.transform = CGAffineTransformIdentity;
            }];
        } else {
            [UIView animateWithDuration:0.25 animations:^{
                self.view.transform = CGAffineTransformIdentity;
                GLobalTabBarController.screenShotView.maskView.alpha = 0.5;
            } completion:^(BOOL finished) {
                GLobalTabBarController.screenShotView.hidden = YES;
            }];
        }
    }
}

//保存截屏的数组
- (NSMutableArray<UIImage *> *)childVCImages{
    if (!_childVCImages) {
        _childVCImages = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _childVCImages;
}

//截屏
- (void)createScreenShot{
    if (self.childViewControllers.count == self.childVCImages.count+1) {
        UIGraphicsBeginImageContextWithOptions(WINDOW.bounds.size, YES, 0);
        [WINDOW.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self.childVCImages addObject:image];
    }
}

//手势代理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (self.popRecognizerEnable == NO)     return NO;
    if (self.viewControllers.count <= 1)    return NO;
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint point = [touch locationInView:gestureRecognizer.view];
        if (point.x < 80.0) {//设置手势触发区
            return YES;
        }
    }
    return NO;
}

//是否与其他手势共存，一般使用默认值(默认返回NO：不与任何手势共存)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if (self.recognizeSimultaneouslyEnable) {
        if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")] || [otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIPanGestureRecognizer")] ) {
            return YES;
        }
    }
    return NO;
}
#pragma mark

@end
