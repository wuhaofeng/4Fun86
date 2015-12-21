//
//  TuWanListCell.h
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanListCell : UITableViewCell
/**左侧图片*/
@property(nonatomic,strong)TRImageView *iconIV;
/**题目标签*/
@property(nonatomic,strong)UILabel *titleLB;
/**长题目标签*/
@property(nonatomic,strong)UILabel *longTitleLB;
/**点击数标签*/
@property(nonatomic,strong)UILabel *clickNumLB;
@end
