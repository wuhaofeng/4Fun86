//
//  TuWanListTableController.m
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListTableController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"
#import "TuWanPicViewController.h"
@interface TuWanListTableController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)TuWanViewModel *tuwanVM;
@end

@implementation TuWanListTableController
{//添加成员变量，不需要懒加载，所以不需要属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLB;
}

/**头部滚动视图*/
-(UIView *)headerView{
    //如果没有头部视图，返回nil
    if(!self.tuwanVM.isExistIndexPic)return nil;
    
    //头部视图  origin无效，宽度无效，肯定与table同宽
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    //添加底部视图(定义几个成员变量)
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLB=[UILabel new];
    [bottomView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl=[UIPageControl new];
    _pageControl.numberOfPages=self.tuwanVM.indexPicNumber ;
    _pageControl.pageIndicatorTintColor=[UIColor greenSeaColor];
    _pageControl.userInteractionEnabled=NO;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLB.mas_right).mas_equalTo(10);
    }];
    _titleLB.text=[self.tuwanVM titleForRowInIndexPic:0];
    //添加滚动栏
    _ic=[iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate=self;
    _ic.dataSource=self;
    _ic.type=10;
    //翻页
    _ic.pagingEnabled=YES;
    //滚动速度
    _ic.pagingEnabled=1;
    //如果只有1张图，不显示原点，不可以滚动
    _pageControl.hidesForSinglePage=YES;
    _ic.scrollEnabled=self.tuwanVM.indexPicNumber!=1;
    if(self.tuwanVM.indexPicNumber>1){
    _ic.autoscroll=0.5;
    _ic.scrollSpeed=0;
    }
    
    return headerView;
}
#pragma mark-iCarousel
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;

}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500-35)];
        UIImageView *imageView=[UIImageView new];
        [view addSubview:imageView];
        imageView.tag=100;
        imageView.contentMode=2;
        view.clipsToBounds=YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    UIImageView *imageView=(UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}
//允许循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option==iCarouselOptionWrap) {
        return YES;
    }
    if (option==iCarouselOptionShowBackfaces) {
        return NO;
    }
    return value;
}
//滚动栏被选中后出发
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.tuwanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlViewController *vc=[[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInIndexPicForRow:index]) {
        TuWanPicViewController *vc=[[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidInIndexPicForRow:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }

}
//监控当前滚动到第几个
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
   // NSLog(@"%ld",carousel.currentItemIndex);
    _titleLB.text=[self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage=carousel.currentItemIndex;

}
-(TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM=[[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView=[self headerView];
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableFooterView=[self headerView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
return self.tuwanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLB.text=[self.tuwanVM titleForRowInList:indexPath.row];
        cell.clickNumLB.text=[self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0 setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][0]];
                     //placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1 setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][1]];
                     //placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2 setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][2]];
                     //placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLB.text=[self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLB.text=[self.tuwanVM descForRowInList:indexPath.row];
    cell.clickNumLB.text=[self.tuwanVM clicksForRowInList:indexPath.row];
    
    
    return cell;
}
/**去掉分割线左侧缝隙*/
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuwanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc=[[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInListForRow:indexPath.row]) {
        TuWanPicViewController *vc=[[TuWanPicViewController alloc]initWithAid:[self.tuwanVM aidInListForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [self.tuwanVM containImages:indexPath.row]?135:90;
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
