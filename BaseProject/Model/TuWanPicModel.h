//
//  TuWanPicModel.h
//  BaseProject
//
//  Created by ios on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class TuWanPicInfochildModel,TuWanPicContentInfoModel,TuWanPicShowitemInfoModel;
@interface TuWanPicModel : BaseModel
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *longtitle;
@property (nonatomic, strong) NSArray *showitem;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, strong) TuWanPicInfochildModel *infochild;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, assign) id toutiao;
@property (nonatomic, assign) double pictotal;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) NSString *banner;
@property (nonatomic, assign) double zangs;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, assign) id timer;
@property (nonatomic, strong) NSArray *relevant;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSArray *content;
@property (nonatomic, strong) NSString *desc;

@end

@interface TuWanPicInfochildModel : BaseModel
@property (nonatomic, strong) NSString *shoot;
@property (nonatomic, strong) NSString *feature;
@property (nonatomic, strong) NSString *facial;
@property (nonatomic, strong) NSString *cn;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *later;
@end

@interface TuWanPicContentModel : BaseModel
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) TuWanPicContentInfoModel *info;
@end

@interface TuWanPicContentInfoModel : BaseModel
@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) double height;
@end

@interface TuWanPicRelevantModel : BaseModel
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *typechild;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *pubdate;

@end
@interface TuWanPicShowitemModel : BaseModel
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) TuWanPicShowitemInfoModel *info;
@end
@interface TuWanPicShowitemInfoModel : BaseModel
@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) double height;
@end

