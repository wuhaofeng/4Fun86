//
//  ImageTableViewCell.h
//  BaseProject
//
//  Created by soft on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface ImageTableViewCell : UITableViewCell

@property (nonatomic,strong) TRImageView *userIV;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UILabel *cateNameLb;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) TRImageView *contentIV;
@property (nonatomic,strong) UILabel *digLb;
@property (nonatomic,strong) UILabel *buryLb;
@property (nonatomic,strong) UILabel *favoriateLb;
@property (nonatomic,strong) UILabel *shareLb;


@end
