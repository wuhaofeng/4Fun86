//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by ios on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [Content class], @"relevant" : [Relevant class]};
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};

}
@end


@implementation Content

@end


@implementation Relevant
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
    
}

@end


