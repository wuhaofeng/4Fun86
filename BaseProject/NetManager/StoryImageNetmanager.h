//
//  StoryImageNetmanager.h
//  BaseProject
//
//  Created by ios on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
//min_time,content_type
@interface StoryImageNetManager : BaseNetManager

+(id)getMinTime:(NSString *)minTime  CompletionHandle:(void(^)(id model,NSError *error))completionHandle;

+(id)getMaxTime:(NSString *)maxTime  CompletionHandle:(void(^)(id model,NSError *error))completionHandle;

@end
