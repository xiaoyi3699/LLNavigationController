//
//  LLFirstViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLFirstViewController.h"
#import "LLWebViewController.h"

@interface LLFirstViewController ()<UITextViewDelegate>
@end

@implementation LLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLAttributeTextView *textView = [[LLAttributeTextView alloc] initWithFrame:CGRectMake(20, 80, 200, 200) text:@"http://www.Hello,World! #你好，世界！#"];
    textView.backgroundColor = [UIColor grayColor];
    textView.delegate = self;
    textView.isVerticalCenter = YES;
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setRightBtnFrame:CGRectMake(SCREEN_WIDTH-45, 20, 40, 20) Title:@"百度"];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [LLFileManager widgetWriteObj:textView.text];
}

- (void)LL_RightBtnItemClick:(UIButton *)rightBtn{
    LLWebViewController *baiduVC = [[LLWebViewController alloc] initWithUrl:@"http://www.baidu.com" title:@"我的百度"];
    [self.navigationController pushViewController:baiduVC animated:YES];
}
@end

