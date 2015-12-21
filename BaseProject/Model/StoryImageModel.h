//
//  StoryModel.h
//  BaseProject
//
//  Created by ios on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class StoryImageDataDataGroupModel,GroupNeihanHotLink2Model,GroupUser2Model,GroupActivity2Model,StoryImageDataModel,LargeImage;
@interface StoryImageModel : BaseModel
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) StoryImageDataModel *data;
@end
@interface StoryImageDataModel : BaseModel
@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) double minTime;
@property (nonatomic, assign) double maxTime;
@property (nonatomic, strong) NSString *tip;
@end
@interface StoryImageDataDataModel : BaseModel
@property (nonatomic, strong) NSArray *comments;
@property(nonatomic,strong)NSString *displayTime;
@property(nonatomic,strong)StoryImageDataDataGroupModel *group;
@property(nonatomic,strong)NSString *onlineTime;
@property(nonatomic,strong)NSNumber *type;
@end

@interface StoryImageDataDataCommentsModel : BaseModel
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userProfileUrl;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double isDigg;
@property (nonatomic, assign) double userBury;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double diggCount;
@property (nonatomic, assign) BOOL userVerified;
@property (nonatomic, assign) double buryCount;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *platformId;
@property (nonatomic, assign) double ID;
@property (nonatomic, assign) double commentId;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, assign) double userDigg;
@property (nonatomic, strong) NSString *userProfileImageUrl;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *commentsDescription;
@end
@interface  StoryImageDataDataGroupModel: BaseModel
@property (nonatomic, assign) BOOL allowDislike;
@property (nonatomic, assign) double shareType;
@property (nonatomic, assign) double ID;
@property (nonatomic, assign) double userBury;
@property (nonatomic, strong) NSString *neihanHotEndTime;
@property (nonatomic, assign) BOOL quickComment;
@property (nonatomic, assign) double buryCount;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) double label;
@property (nonatomic, strong) NSString *neihanHotStartTime;
@property (nonatomic, assign) double shareCount;
@property (nonatomic, assign) BOOL categoryVisible;
@property (nonatomic, assign) double hasComments;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) BOOL isNeihanHot;
@property (nonatomic, assign) double userFavorite;
@property (nonatomic, assign) double userDigg;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double categoryType;
@property (nonatomic, strong) GroupUser2Model *user;
@property (nonatomic, strong) NSArray *dislikeReason;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double isCanShare;
@property (nonatomic, strong) NSString *statusDesc;
@property (nonatomic, assign) double diggCount;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) GroupNeihanHotLink2Model *neihanHotLink;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, strong) GroupActivity2Model *activity;
@property (nonatomic, assign) double userRepin;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL isAnonymous;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) double goDetailCount;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, assign) double repinCount;
@property (nonatomic, assign) double hasHotComments;
@property (nonatomic, strong) LargeImage *largeImage;
@end
/**group中的生成的model类*/
@interface GroupActivity2Model : BaseModel

@end
@interface  GroupNeihanHotLink2Model: BaseModel

@end
@interface  GroupUser2Model: BaseModel
@property (nonatomic, assign) double userId;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isFollowing;
@property (nonatomic, assign) BOOL userVerified;
@end
@interface  GroupDislikeReason2Model: BaseModel
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double ID;
@property (nonatomic, strong) NSString *title;
@end

@interface UrlList : NSObject

@property (nonatomic, copy) NSString *url;

@end

@interface LargeImage : NSObject

@property (nonatomic, copy) NSString *uri;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, strong) NSArray<UrlList *> *urlList;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger r_height;

@property (nonatomic, assign) NSInteger r_width;

@end
