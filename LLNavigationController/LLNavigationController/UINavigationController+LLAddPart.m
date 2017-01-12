//
//  UINavigationController+LLAddPart.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/10/13.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "UINavigationController+LLAddPart.h"
#import <objc/runtime.h>

@implementation UINavigationController (LLAddPart)

#pragma mark - 为系统类扩展属性
static BOOL _recognizeSimultaneouslyEnable;
static BOOL _popRecognizerEnable;
- (void)setRecognizeSimultaneouslyEnable:(BOOL)recognizeSimultaneouslyEnable {
    NSNumber *t = @(recognizeSimultaneouslyEnable);
    objc_setAssociatedObject(self, &_recognizeSimultaneouslyEnable, t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)recognizeSimultaneouslyEnable {
    NSNumber *t = objc_getAssociatedObject(self, &_recognizeSimultaneouslyEnable);
    return [t boolValue];
}

- (void)setPopRecognizerEnable:(BOOL)popRecognizerEnable {
    NSNumber *t = @(popRecognizerEnable);
    objc_setAssociatedObject(self, &_popRecognizerEnable, t, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)popRecognizerEnable {
    NSNumber *t = objc_getAssociatedObject(self, &_popRecognizerEnable);
    return [t boolValue];
}
#pragma mark

@end
