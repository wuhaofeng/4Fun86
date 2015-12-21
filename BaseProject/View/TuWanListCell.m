//
//  TuWanListCell.m
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
-(TRImageView *)iconIV{
    if (!_iconIV) {
        _iconIV=[TRImageView new];
        //_iconIV.contentMode=UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}
-(UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB=[UILabel new];
        _titleLB.font=[UIFont systemFontOfSize:17];
    }
    return _titleLB;
}
-(UILabel *)longTitleLB{
    if (!_longTitleLB) {
        _longTitleLB=[UILabel new];
        _longTitleLB.font=[UIFont systemFontOfSize:14];
        _longTitleLB.textColor=[UIColor lightGrayColor];
        _longTitleLB.numberOfLines=0;
    }
    return _longTitleLB;
}
-(UILabel *)clickNumLB{
    if (!_clickNumLB) {
        _clickNumLB=[UILabel new];
        _clickNumLB.font=[UIFont systemFontOfSize:12];
        _clickNumLB.textColor=[UIColor lightGrayColor];
    }
    return _clickNumLB;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview: self.iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92,70));
            make.centerY.mas_equalTo(0);
        }];
        [self.contentView addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            //距离图片的上边缘向下移动了3像素
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(3);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            
        }];
        [self.contentView addSubview:self.longTitleLB];
        [self.longTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLB.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLB.mas_rightMargin);
            make.top.mas_equalTo(_titleLB.mas_bottom).mas_equalTo(8);
        }];
        [self.contentView addSubview:self.clickNumLB];
        [self.clickNumLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLB.mas_rightMargin);
            
        }];
    }
    return self;

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
