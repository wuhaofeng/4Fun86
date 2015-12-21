//
//  StoryModel.m
//  BaseProject
//
//  Created by ios on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryModel.h"

@implementation StoryModel

@end
@implementation StoryDataModel
+(NSDictionary *)objectClassInArray{
    return @{@"data":[StoryDataDataModel class]};

}

@end
@implementation StoryDataDataModel

+(NSDictionary*)objectClassInArray{
    return @{@"comments":[StoryDataDataCommentsModel class]};

}
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};

}

@end
@implementation StoryDataDataCommentsModel


@end

@implementation StoryDataDataGroupModel

+(NSDictionary *)objectClassInArray{
    return @{@"dislikeReason":[GroupDislikeReasonModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};

}
@end
@implementation GroupActivityModel



@end
@implementation GroupUserModel



@end
@implementation GroupNeihanHotLinkModel



@end
@implementation GroupDislikeReasonModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
    
}

@end