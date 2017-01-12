//
//  LLSecondViewController.m
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLSecondViewController.h"

@interface LLSecondViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_titles;
}
@property (strong,nonatomic)NSArray *titles;
@property (strong,nonatomic)NSArray *targets;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation LLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    static NSInteger i = 2;
    self.title = [NSString stringWithFormat:@"第%ld页",(long)i];
    
    _titles = @[@"下一页"];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _titles = @[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setRightBtnFrame:CGRectMake(SCREEN_WIDTH-75, 20, 70, 20) Title:@"继续"];
    
    self.navigationController.popRecognizerEnable = YES;         //是否响应滑动返回手势
    self.navigationController.recognizeSimultaneouslyEnable = NO;//滑动返回手势是否与其他手势共存
}

- (void)LL_RightBtnItemClick:(UIButton *)rightBtn{
    LLSecondViewController *secondVC = [[LLSecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    
    UITableViewRowAction *stickAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"pop到第3页" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if (self.navigationController.childViewControllers.count > 4) {
            UIViewController *vc = self.navigationController.childViewControllers[2];
            [self.navigationController popToViewController:vc animated:YES];
        }
    }];
    stickAction.backgroundColor = [UIColor brownColor];
    
    UITableViewRowAction *ignoreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"忽略" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        tableView.editing = NO;
    }];
    ignoreAction.backgroundColor = [UIColor grayColor];
    
    return @[deleteAction,stickAction,ignoreAction];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [GLobalTabBar.items[0] setBadgeValue:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
}

@end
