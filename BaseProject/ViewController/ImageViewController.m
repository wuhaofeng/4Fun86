//
//  ImageViewController.m
//  BaseProject
//
//  Created by soft on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageViewModel.h"
#import "ImageTableViewCell.h"
#import "WebViewViewController.h"
#import "Factory.h"
#import "LeftViewController.h"

@interface ImageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) ImageViewModel *imageVM;

@end

@implementation ImageViewController

+ (UINavigationController *)standardImageNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ImageViewController *vc = [[ImageViewController alloc]init];
        vc.navigationItem.title = @"图片";
        [vc getContent];
        [vc.tableView.header beginRefreshing];
        [vc.tableView registerClass:[ImageTableViewCell class] forCellReuseIdentifier:@"Cell"];
        [Factory addMenuItemToVC:vc];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (void)getContent{
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.imageVM getDataFromNetCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
            [_tableView.footer resetNoMoreData];
        }];
    }];
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.imageVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
}

- (ImageViewModel *)imageVM{
    if(!_imageVM){
        _imageVM = [ImageViewModel new];
    }
    return _imageVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图片";
    [self getContent];
    [self.tableView.header beginRefreshing];
    [self.tableView registerClass:[ImageTableViewCell class] forCellReuseIdentifier:@"Cell"];
     [Factory addMenuItemToVC:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.imageVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell.userIV.imageView setImageWithURL:[self.imageVM userIVURLForRow:indexPath.section]];
    cell.nameLb.text = [self.imageVM userNameForRow:indexPath.section];
    cell.cateNameLb.text = [self.imageVM cateNameForRow:indexPath.section];
    cell.digLb.text = [self.imageVM digForRow:indexPath.section];
    cell.buryLb.text = [self.imageVM buryForRow:indexPath.section];
    cell.shareLb.text = [self.imageVM shareForRow:indexPath.section];
    [cell.contentIV.imageView setImageWithURL:[self.imageVM contentIVURLForRow:indexPath.section]];
    //    [cell.contentIV.imageView setImageWithURL:[NSURL URLWithString:@"http://p6.pstatp.com/large/3598/2924774061"]];
    cell.titleLb.text = [self.imageVM contentForRow:indexPath.section];
    cell.favoriateLb.text = [self.imageVM favouriteForRow:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WebViewViewController *vc = [[WebViewViewController alloc]initWithUrl:[self.imageVM nextPageURLForRow:indexPath.section]];
    vc.hidesBottomBarWhenPushed=YES;
    //    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
