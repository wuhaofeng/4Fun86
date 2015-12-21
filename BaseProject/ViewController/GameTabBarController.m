//
//  GameTabBarController.m
//  BaseProject
//
//  Created by ios on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameTabBarController.h"

@interface GameTabBarController ()

@end

@implementation GameTabBarController
+(GameTabBarController*)standardInstance{
    static GameTabBarController *vc=nil;
  static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    vc=[GameTabBarController new];
});
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent=NO;
    TuWanListTableController *VC1=[TuWanListTableController new];
    VC1.infoType=@0;
    TuWanListTableController *VC2=[TuWanListTableController new];
    VC2.infoType=@1;
    TuWanListTableController *VC3=[TuWanListTableController new];
    VC3.infoType=@2;
    TuWanListTableController *VC4=[TuWanListTableController new];
    VC4.infoType=@3;
    UINavigationController *Nav1=[[UINavigationController alloc]initWithRootViewController:VC1];
    VC1.title=@"炉石传说";
    UINavigationController *Nav2=[[UINavigationController alloc]initWithRootViewController:VC2];
    VC2.title=@"独家新闻";
    UINavigationController *Nav3=[[UINavigationController alloc]initWithRootViewController:VC3];
    VC3.title=@"女生写真";
    UINavigationController *Nav4=[[UINavigationController alloc]initWithRootViewController:VC4];
    VC4.title=@"游戏攻略";
    self.viewControllers=@[Nav1,Nav2,Nav3,Nav4];
    Nav1.tabBarItem.title=@"炉石";
    Nav1.tabBarItem.image=[UIImage imageNamed:@"a"];
    Nav2.tabBarItem.title=@"新闻";
    Nav2.tabBarItem.image=[UIImage imageNamed:@"c"];
    Nav3.tabBarItem.title=@"COS";
    Nav3.tabBarItem.image=[UIImage imageNamed:@"a"];
    Nav4.tabBarItem.title=@"攻略";
    Nav4.tabBarItem.image=[UIImage imageNamed:@"c"];
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
