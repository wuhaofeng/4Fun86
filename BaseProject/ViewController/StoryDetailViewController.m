//
//  StoryDetailViewController.m
//  BaseProject
//
//  Created by ios on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "StoryViewModel.h"
@interface StoryDetailViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,strong)StoryViewModel *storyVM;
@end

@implementation StoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.shareUrl]];
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

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
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
