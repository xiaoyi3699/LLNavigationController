[iOS使用系统的导航栏，自定义滑动返回手势与转场动画](http://www.jianshu.com/p/2eb6cd11fabd)<br />

//自定义滑动返回手势与动画

![Image text](https://github.com/wangzhaomeng/LLNavigationController/blob/master/LLNavigationController/image.PNG?raw=true)

//自定义转场动画
```
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
```


