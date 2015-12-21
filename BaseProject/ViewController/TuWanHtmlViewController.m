//
//  TuWanHtmlViewController.m
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlViewController.h"
#import "Factory.h"
@interface TuWanHtmlViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation TuWanHtmlViewController
-(UIWebView *)webView{
    if (!_webView) {
        _webView=[UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate=self;
    }
    return _webView;
}
-(instancetype)initWithURL:(NSURL *)url{
    if (self=[super init]) {
        self.url=url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
}
#pragma mark-UIwebViewdelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];//旋转提示
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
  [self hideProgress];
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
