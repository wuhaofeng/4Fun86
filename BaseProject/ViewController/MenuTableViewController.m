//
//  MenuTableViewController.m
//  BaseProject
//
//  Created by ios on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MenuTableViewController.h"
#import "MenuViewModel.h"
#import "MenuListTableViewController.h"
@interface MenuTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)MenuViewModel *menuVM;
@property(nonatomic,strong)MenuListTableViewController *vc;
@end

@implementation MenuTableViewController

-(MenuViewModel *)menuVM{
    if (!_menuVM) {
        _menuVM=[MenuViewModel new];
    }
    return _menuVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.menuVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.menuVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:300];
    label.text=[self.menuVM textForRow:indexPath.row];
    UIImageView *iconIV=(UIImageView *)[cell.contentView viewWithTag:200];
    [iconIV setImageWithURL:[self.menuVM iconUrlForRow:indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.vc.title=[self.menuVM textForRow:indexPath.row];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath*)indexPath {
    self.vc=segue.destinationViewController;

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
