//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by ios on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanPicModel.h"
#import "TuWanVideoModel.h"
typedef NS_ENUM(NSInteger,TuWanType){
    TuWanTypeLuShi,
    TuWanTypeDuJia,
    TuWanTypeMeiNv,
    TuWanTypeGongLve,
 };
@interface TuWanNetManager : BaseNetManager
+ (id)getTuWanInfoWithType:(TuWanType)type start:(NSInteger)start kCompletionHandle;
+(id)getTuWanDetailPicWithAid:(NSString *)aid kCompletionHandle;
+(id)getTuWanDetailVideoWithAid:(NSString *)aid kCompletionHandle;
@end
