//
//  TuWanHtmlViewController.h
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanHtmlViewController : UIViewController
-(instancetype)initWithURL:(NSURL *)url;
@property(nonatomic,strong)NSURL *url;
@end
