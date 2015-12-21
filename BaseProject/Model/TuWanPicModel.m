//
//  TuWanPicModel.m
//  BaseProject
//
//  Created by ios on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicModel.h"

@implementation TuWanPicModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};

}
+(NSDictionary *)objectClassInArray{
    return @{@"content":[TuWanPicContentModel class],@"relevant":[TuWanPicRelevantModel class],@"showitem":[TuWanPicShowitemModel class]};

}

@end
@implementation TuWanPicContentModel


@end
@implementation TuWanPicInfochildModel


@end
@implementation TuWanPicContentInfoModel


@end
@implementation TuWanPicRelevantModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};

}

@end
@implementation TuWanPicShowitemModel


@end
@implementation TuWanPicShowitemInfoModel


@end




