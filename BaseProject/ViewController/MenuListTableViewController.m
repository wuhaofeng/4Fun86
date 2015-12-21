//
//  MenuListTableViewController.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuListTableViewController.h"
#import "MenuListViewModel.h"
#import "MenuListCell.h"
#import "MenuListDetailViewController.h"
@interface MenuListTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)MenuListViewModel *menuListVM;
@end

@implementation MenuListTableViewController
-(MenuListViewModel *)menuListVM{
    if (!_menuListVM) {
        _menuListVM=[[MenuListViewModel alloc]initWithText:self.title];
    }
    return _menuListVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.menuListVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.menuListVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.menuListVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    cell.titleLB.text=[self.menuListVM titleForRow:indexPath.row];
    cell.titleLB.layer.cornerRadius=16;
    cell.titleLB.layer.borderColor=[UIColor greenSeaColor].CGColor;
    cell.titleLB.layer.borderWidth=2;
    cell.timeLB.text=[self.menuListVM cookingTimeForRow:indexPath.row];
    cell.tasteLB.text=[self.menuListVM tasteForRow:indexPath.row];
//    cell.likesLB.text=[self.menuListVM likesForRow:indexPath.row];
    cell.likesLB.text=[self.menuListVM IDForRow:indexPath.row];
    UIImageView *iv1=(UIImageView *)[cell.contentView viewWithTag:100];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"1" ofType:@"jpg"];
    iv1.image=[UIImage imageWithContentsOfFile:path];
    UIImageView *iv2=(UIImageView *)[cell.contentView viewWithTag:200];
    NSString *path2=[[NSBundle mainBundle]pathForResource:@"2" ofType:@"jpg"];
    iv2.image=[UIImage imageWithContentsOfFile:path2];
    UIImageView *iv3=(UIImageView *)[cell.contentView viewWithTag:300];
    NSString *path3=[[NSBundle mainBundle]pathForResource:@"3" ofType:@"jpg"];
    iv3.image=[UIImage imageWithContentsOfFile:path3];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuListDetailViewController *vc=[MenuListDetailViewController new];
    vc.ID=[self.menuListVM IDForRow:indexPath.row];
    vc.title=[self.menuListVM titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
