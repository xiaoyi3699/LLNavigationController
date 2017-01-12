//
//  LLScreenShotView.m
//  LLFoundation
//
//  Created by Mr.Wang on 16/12/9.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLScreenShotView.h"

#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds
@implementation LLScreenShotView

- (id)init{
    self = [super initWithFrame:SCREEN_BOUNDS];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:SCREEN_BOUNDS];
        [self addSubview:_imageView];
        
        _maskView = [[UIView alloc] initWithFrame:SCREEN_BOUNDS];
        _maskView.backgroundColor = [UIColor blackColor];
        [self addSubview:_maskView];
    }
    return self;
}

@end
