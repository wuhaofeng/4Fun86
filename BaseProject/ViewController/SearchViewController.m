//
//  SearchViewController.m
//  BaseProject
//
//  Created by ios on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
@interface SearchViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end
//http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView
@implementation SearchViewController
-(id)init
{
    self = [super init];
    if (self) {
        self.title=@"召唤师查询";
    }
    return self;
}
+(UINavigationController *)sharedLolNavi{
    static UINavigationController *navi=nil;
   static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    SearchViewController *vc=[SearchViewController new];
    navi=[[UINavigationController alloc]initWithRootViewController:vc];
});
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"召唤师查询";
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view  addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
-(UIWebView *)webView{
    if (!_webView) {
        _webView=[UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"]]];
        _webView.delegate=self;
    }
    return _webView;

}
//如果返回NO，则不会加载请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//点击web中的任意一项，跳转到下一页
    //NSLog(@"URL  %@",request.URL.absoluteString);
    //如果当前加载的不是当前界面
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [webView showProgress];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView hideProgress];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [webView hideProgress];

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
