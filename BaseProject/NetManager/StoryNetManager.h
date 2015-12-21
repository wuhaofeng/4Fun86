//
//  StoryNetManager.h
//  BaseProject
//
//  Created by ios on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//min_time,content_type
@interface StoryNetManager : BaseNetManager

+(id)getMinTime:(NSString *)minTime  CompletionHandle:(void(^)(id model,NSError *error))completionHandle;
@end
