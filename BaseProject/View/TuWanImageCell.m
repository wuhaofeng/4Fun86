//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell
-(UILabel *)titleLB{
    if (_titleLB==nil) {
        _titleLB=[UILabel new];
        _titleLB.font=[UIFont systemFontOfSize:17];
    }
    return _titleLB;
}
-(UILabel *)clickNumLB{
    if (_clickNumLB==nil) {
        _clickNumLB=[UILabel new];
        _clickNumLB.textColor=[UIColor lightGrayColor];
        _clickNumLB.font=[UIFont systemFontOfSize:12];
        _clickNumLB.textAlignment = NSTextAlignmentRight;
    }
    return _clickNumLB;
}
-(UIImageView *)iconIV0{
    if (!_iconIV0) {
        _iconIV0=[UIImageView new];
        
    }
    return _iconIV0;
}
-(UIImageView *)iconIV1{
    if (!_iconIV1) {
        _iconIV1=[UIImageView new];
             }
    return _iconIV1;
}
-(UIImageView *)iconIV2{
    if (!_iconIV2) {
        _iconIV2=[UIImageView new];
        
    }
    return _iconIV2;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.clickNumLB];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clickNumLB.mas_left).mas_equalTo(-10);
        }];
       
        [self.clickNumLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(70);
            make.width.mas_greaterThanOrEqualTo(40);
        }];
        
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLB.mas_bottom).mas_equalTo(5);
        }];
        
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV0);
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
