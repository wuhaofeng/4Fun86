//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "StoryNetManager.h"
#import "MenuViewModel.h"
#import "ImageViewController.h"
#import "LeftViewController.h"
@interface AppDelegate ()
@property(nonatomic,strong)RESideMenu *sideMenu;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeWithApplication:application];
    //UINavigationController *vc=kVCFromSb(@"Navi1", @"Main");
    //    UINavigationController *vc=kVCFromSb(@"Navi3", @"Main");
    self.window.rootViewController=self.sideMenu;
    [self configGloalUIStyle];
    return YES;
}
/**配置全局UI的样式*/
-(void)configGloalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance]setTranslucent:NO];
    /** 设置导航栏背景图*/
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:(UIBarMetricsDefault)];
    /** 配置导航栏题目的样式*/
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldFlatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
    
    
}
-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
        UITabBarController *tabBar=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"TabBar"];
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:tabBar leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        _sideMenu.backgroundImage=[UIImage imageNamed:@"4"];
        //可以让出现时菜单不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden=YES;
        //不允许菜单栏缩小到了边缘还可以缩小
        _sideMenu.bouncesHorizontally=NO;
    }
    return _sideMenu;
}
@end
