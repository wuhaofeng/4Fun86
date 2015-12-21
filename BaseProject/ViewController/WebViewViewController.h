//
//  WebViewViewController.h
//  BaseProject
//
//  Created by soft on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController

- (id)initWithUrl:(NSURL *)url;
@property (nonatomic,strong) NSURL *url;

@end
