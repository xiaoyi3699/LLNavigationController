//
//  UINavigationController+LLAddPart.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/10/13.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LLAddPart)

#pragma mark - 为系统类扩展属性
//是否响应自定义的滑动返回手势
- (void)setPopRecognizerEnable:(BOOL)popRecognizerEnable;
- (BOOL)popRecognizerEnable;

//自定义的滑动返回手势是否与其他手势共存，一般使用默认值(默认返回NO：不与任何手势共存)
- (void)setRecognizeSimultaneouslyEnable:(BOOL)recognizeSimultaneouslyEnable;
- (BOOL)recognizeSimultaneouslyEnable;
#pragma mark

#pragma mark - 为系统类扩展方法,无需实现
- (void)showLeftBtn:(BOOL)show;
- (void)showRightBtn:(BOOL)show;
- (void)leftBtnItemClick:(UIButton *)leftBtn;
- (void)rightBtnItemClick:(UIButton *)rightBtn;
- (void)setRightBtnFrame:(CGRect)frame Title:(NSString *)title;
- (void)setRightBtnFrame:(CGRect)frame image:(UIImage *)image;
#pragma mark

@end
