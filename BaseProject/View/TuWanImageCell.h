//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanImageCell : UITableViewCell
/**题目标签*/
@property(nonatomic,strong)UILabel *titleLB;
/**点击数标签*/
@property(nonatomic,strong)UILabel *clickNumLB;
/**图片一*/
@property(nonatomic,strong)UIImageView *iconIV0;
/**图片二*/
@property(nonatomic,strong)UIImageView *iconIV1;
/**图片三*/
@property(nonatomic,strong)UIImageView *iconIV2;
@end
