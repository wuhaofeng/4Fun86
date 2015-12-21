//
//  LeftViewController.m
//  BaseProject
//
//  Created by ios on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "SearchViewController.h"
#import "GameTabBarController.h"
#import "TRImageView.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *itemNames;
@end

@implementation LeftViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        TRImageView  *iconIV=[[TRImageView alloc]init];
        iconIV.imageView.image=[UIImage imageNamed:@""];
        [self.view addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(kWindowH/4-70);
        }];
         _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
   
}
-(NSArray *)itemNames{
    return @[@"欢乐一刻",@"美食天下",@"游戏资讯",@"英雄联盟"];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType=1;
    cell.textLabel.text=self.itemNames[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=[UIColor greenSeaColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:kVCFromSb(@"TabBar", @"Main")  animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            case 1:
            [self.sideMenuViewController setContentViewController:kVCFromSb(@"Navi1", @"Main") animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            case 2:
            [self.sideMenuViewController setContentViewController:[GameTabBarController standardInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            [self.sideMenuViewController setContentViewController:[SearchViewController sharedLolNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        default:
            break;
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
