//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by ios on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"
#import "Factory.h"
@interface TuWanPicViewController ()<MWPhotoBrowserDelegate>
@property(nonatomic ,strong)TuWanPicViewModel *tuwanPicVM;
@end

@implementation TuWanPicViewController
-(id)initWithAid:(NSString *)aid{
    if (self=[super init]) {
        self.aid=aid;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert1(NO, @"%s 必须使用initWithType", __func__);
    }
    return self;
}
-(TuWanPicViewModel *)tuwanPicVM{
    if (!_tuwanPicVM) {
        _tuwanPicVM=[[TuWanPicViewModel alloc]initWithAid:self.aid];
    }
    return _tuwanPicVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  //非xib,storyBoard默认背景色是透明
    self.view.backgroundColor=[UIColor whiteColor];
    [Factory addBackItemToVC:self];
    //请求时，有正在操作的提示
    [self showProgress];
    [self.tuwanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        //图片展示页的创建，Github排名最高的图片展示类
        MWPhotoBrowser *photoB=[[MWPhotoBrowser alloc]initWithDelegate:self];
        //图片展示页面不应该是推出的，而应该是取代当前页面在导航控制器的位置
        NSMutableArray *naviVCs=[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCs removeLastObject];
        [naviVCs addObject:photoB];
        //把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers=naviVCs;
    }];
}
#pragma mark-MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.tuwanPicVM.rowNumber;

}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo=[MWPhoto photoWithURL:[self.tuwanPicVM picURLForRow:index]];
    return photo;
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
