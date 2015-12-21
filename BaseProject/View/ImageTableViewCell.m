//
//  ImageTableViewCell.m
//  BaseProject
//
//  Created by soft on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ImageTableViewCell.h"
#define kSpace (kWindowW - 20 - 4*50)/3.0


@implementation ImageTableViewCell

- (TRImageView *)userIV {
    if(_userIV == nil) {
        _userIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_userIV];
        [_userIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }
    return _userIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:16];
        _nameLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.userIV);
            make.left.mas_equalTo(self.userIV.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
    }
    return _nameLb;
}

- (UILabel *)titleLb{
    if(!_titleLb){
        _titleLb = [UILabel new];
        _titleLb.numberOfLines =  0;
        _titleLb.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIV);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(15);
            make.right.mas_equalTo(-5);
        }];
    }
    return _titleLb;
}

- (UILabel *)cateNameLb {
    if(_cateNameLb == nil) {
        _cateNameLb = [[UILabel alloc] init];
        _cateNameLb.font = [UIFont systemFontOfSize:17];
        _cateNameLb.textColor = [UIColor greenSeaColor];
        _cateNameLb.layer.borderColor = [UIColor greenSeaColor].CGColor;
        _cateNameLb.layer.borderWidth = 2;
        _cateNameLb.layer.cornerRadius = 3;
        [self.contentView addSubview:_cateNameLb];
        [_cateNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
        }];
    }
    return _cateNameLb;
}

- (TRImageView *)contentIV {
    if(_contentIV == nil) {
        _contentIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_contentIV];
        [_contentIV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.nameLb);
//            make.top.mas_equalTo(self.cateNameLb).mas_equalTo(10);
//            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(self.cateNameLb.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(self.cateNameLb);
            make.right.mas_equalTo(-5);
        }];
    }
    return _contentIV;
}

- (UILabel *)digLb {
    if(_digLb == nil) {
        _digLb = [[UILabel alloc] init];
        _digLb.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_digLb];
        [_digLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentIV.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.width.mas_equalTo(50);
        }];
    }
    return _digLb;
}

- (UILabel *)buryLb {
    if(_buryLb == nil) {
        _buryLb = [[UILabel alloc] init];
        _buryLb.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_buryLb];
        [_buryLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.digLb.mas_right).mas_equalTo(kSpace);
            make.centerY.mas_equalTo(self.digLb);
            make.width.mas_equalTo(self.digLb);
        }];
    }
    return _buryLb;
}

- (UILabel *)favoriateLb {
    if(_favoriateLb == nil) {
        _favoriateLb = [[UILabel alloc] init];
        _favoriateLb.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_favoriateLb];
        [_favoriateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.buryLb.mas_right).mas_equalTo(kSpace);
            make.centerY.mas_equalTo(self.buryLb);
            make.bottom.mas_equalTo(-5);
            make.width.mas_equalTo(self.buryLb);
        }];
    }
    return _favoriateLb;
}

- (UILabel *)shareLb {
    if(_shareLb == nil) {
        _shareLb = [[UILabel alloc] init];
        _shareLb.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:_shareLb];
        [_shareLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.favoriateLb.mas_right).mas_equalTo(kSpace);
            make.centerY.mas_equalTo(self.favoriateLb);
            make.right.mas_equalTo(-5);
            make.width.mas_equalTo(self.favoriateLb);
        }];
    }
    return _shareLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
