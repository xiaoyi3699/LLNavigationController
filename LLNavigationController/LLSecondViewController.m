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
@property (strong,nonatomic)BezierCurveView *bezierView;
@property (strong,nonatomic)NSArray *titles;
@property (strong,nonatomic)NSArray *targets;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation LLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titles = @[@"下一页"];
    
    _containerView.frame = CGRectMake(0, 64, SCREEN_WIDTH,NON_NAV_HEIGHT);
    _tableView = [[UITableView alloc] initWithFrame:_containerView.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_containerView addSubview:_tableView];
    
    _titles = @[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"];
    _targets = @[@20,@40,@20,@50,@30,@90,@30,@100,@70];
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
    
    UITableViewRowAction *stickAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"置顶");
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
    switch (indexPath.row) {
        case 0:{
            if (_bezierView) {
                [_bezierView removeFromSuperview];
                _bezierView = nil;
                return;
            }
            LLSecondViewController *secondVC = [[LLSecondViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
            break;
        }
        case 1:{//折线图
            //直线
            [self createBezierView];
            [_bezierView drawLineChartViewWithX_Value_Names:_titles TargetValues:_targets LineType:LineType_Straight];
            break;
        }
        case 2:{
            //曲线
            [self createBezierView];
            [_bezierView drawLineChartViewWithX_Value_Names:_titles TargetValues:_targets LineType:LineType_Curve];
            break;
        }
        case 3:{//柱状图
            [self createBezierView];
            [_bezierView drawBarChartViewWithX_Value_Names:_titles TargetValues:_targets];
            
            break;
        }
        case 4:{//饼状图
            [self createBezierView];
            [_bezierView drawPieChartViewWithX_Value_Names:_titles TargetValues:_targets];
            break;
        }
        case 5:{
            
            break;
        }
        case 6:{
            
            break;
        }
        case 7:{
            
            break;
        }
        case 8:{
            
            break;
        }
        case 9:{
            
            break;
        }
        case 10:{
            
            break;
        }
        case 11:{
            
            break;
        }
        case 12:{
            
            break;
        }
        case 13:{
            
            break;
        }
        case 14:{
            
            break;
        }
        case 15:{
            
            break;
        }
        case 16:{
            
            break;
        }
        default:{
            
            break;
        }
    }
}

- (void)createBezierView{
    if (_bezierView) {
        [_bezierView removeFromSuperview];
        _bezierView = nil;
    }
    _bezierView = [[BezierCurveView alloc] initWithFrame:CGRectMake(30, 30, SCREEN_WIDTH-10, 280)];
    _bezierView.center = self.view.center;
    [self.view addSubview:_bezierView];
}

@end
