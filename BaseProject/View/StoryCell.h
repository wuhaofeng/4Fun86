//
//  StoryCell.h
//  BaseProject
//
//  Created by ios on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *textLB;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLB;
@property (weak, nonatomic) IBOutlet UILabel *diggCountLB;
@property (weak, nonatomic) IBOutlet UILabel *buryCountLB;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLB;
@property (weak, nonatomic) IBOutlet UILabel *shareCountLB;

@end
