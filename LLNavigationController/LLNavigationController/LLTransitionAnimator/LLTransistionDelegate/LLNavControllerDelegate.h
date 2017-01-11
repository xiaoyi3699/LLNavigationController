//
//  LLNavControllerDelegate.h
//  LLFoundation
//
//  Created by Mr.Wang on 17/1/10.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNavControllerDelegate : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong) NSString *presentTransition;
@property (nonatomic, strong) NSString *dismissTransition;

@end
