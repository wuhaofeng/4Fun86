//
//  StoryModel.m
//  BaseProject
//
//  Created by ios on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryImageModel.h"

@implementation StoryImageModel

@end
@implementation StoryImageDataModel
+(NSDictionary *)objectClassInArray{
    return @{@"data":[StoryImageDataDataModel class]};

}

@end
@implementation StoryImageDataDataModel

+(NSDictionary*)objectClassInArray{
    return @{@"comments":[StoryImageDataDataCommentsModel class]};

}
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};

}

@end
@implementation StoryImageDataDataCommentsModel


@end

@implementation StoryImageDataDataGroupModel

+(NSDictionary *)objectClassInArray{
    return @{@"dislikeReason":[GroupDislikeReason2Model class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};

}
@end
@implementation GroupActivity2Model



@end
@implementation GroupUser2Model



@end
@implementation GroupNeihanHotLink2Model



@end
@implementation GroupDislikeReason2Model

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
    
}

@end

@implementation UrlList



@end

@implementation LargeImage

+ (NSDictionary *)objectClassInArray{
    return @{@"urlList" : [UrlList class]};
}

@end
