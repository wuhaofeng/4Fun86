//
//  WebViewViewController.m
//  BaseProject
//
//  Created by soft on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WebViewViewController.h"
#import "Factory.h"
@interface WebViewViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation WebViewViewController

- (id)initWithUrl:(NSURL *)url{
    if(self = [super init]){
        self.url = url;
    }
    return self;
}

- (UIWebView *)webView{
    if(!_webView){
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.navigationItem.title = @"内容";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
//    self.navigationItem.leftBarButtonItem = item;
}


#pragma -UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
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
