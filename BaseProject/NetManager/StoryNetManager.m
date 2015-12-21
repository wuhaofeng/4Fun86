//
//  StoryNetManager.m
//  BaseProject
//
//  Created by ios on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryNetManager.h"
#import "StoryModel.h"
#define  kOsVersion [@"iOS" stringByAppendingString:[UIDevice currentDevice].systemVersion]
#define kDeviceType @"device_type":@"iPhone%205S"
#define kChannel  @"channel":@"App%20Store"
@implementation StoryNetManager
+(id)getMinTime:(NSString *)minTime  CompletionHandle:(void(^)(id model,NSError *error))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-102&iid=3205044434&idfa=idfa&version_code=4.4.2&aid=7&os_version=%@&screen_width=640&vid=29B30FEE-23D8-419E-AA0C-F9FFAFA6088E&device_id=7532213948&os_api=18&app_name=joke_essay&device_platform=iphone&ac=WIFI&openudid=e09852d439ed494717df537a0555b4beb26893a8&city=浙江省&content_type=-102&count=30&essence=1&latitude=30.31100095250565&longitude=120.3642546531639&message_cursor=0&min_time=%@&mpic=1",kOsVersion,minTime];
    path=[StoryNetManager percentPathWithPath:path params:@{kDeviceType,kChannel}];
    return [StoryNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([StoryModel objectWithKeyValues:responseObj],error);
    }];
}
@end
