//
//  TuWanNetManager.m
//  BaseProject
//
//  Created by ios on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#define kTuWanPath  @"http://cache.tuwan.com/app/"
#define kAppId      @"appid": @1
#define kAppVer     @"appver": @2.1
#define kClassMore  @"classmore": @"indexpic"

//定义成宏，防止哪天服务器人员犯病，突然改动所有dtid键为tuwanID。 我们只需要改变宏中的字符串即可。
#define kRemoveClassMore(dic)        [dic removeObjectForKey:@"classmore"];
#define kSetDtId(string, dic)        [dic setObject:string forKey:@"dtid"];
#define kSetClass(string, dic)       [dic setObject:string forKey:@"class"];
#define kSetMod(string, dic)         [dic setObject:string forKey:@"mod"];

@implementation TuWanNetManager
//方法：把path和参数拼接起来，把字符串中的中文转换成百分号形式，因为有的服务器不接受中文编码
+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    NSMutableString *percentPath=[NSMutableString stringWithString:path];
    NSArray *keys=params.allKeys;
    NSInteger count=keys.count;
    
    /*
     for(int i=0;i<params.allKeys;i++){
     
     }
     假设foe循环1000次，params.allKeys实际上调用的[params allKeys],会调用allKeys一千次。OC语言的特性是runtime实际我们调用一个方法，底层操作是在一个方法列表中所搜你调用的方法所在的地址，然后调用完毕后把这个方法名转移到常用的方法列表，所以如果再次执行就在常用列表中搜索调用，效率更高
     */
    for (int i=0; i<count; i++) {
        if (i==0) {
            [percentPath appendFormat:@"?%@=%@&",keys[i],params[keys[i]]];
        }
        else{
            [percentPath appendFormat:@"%@=%@&",keys[i],params[keys[i]]];
        }
    }
    //把字符串的中文转化成%形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (id)getTuWanInfoWithType:(TuWanType)type start:(NSInteger)start kCompletionHandle{
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithDictionary:@{kAppVer, kAppId, @"start": @(start), kClassMore}];
    switch (type) {

        case TuWanTypeLuShi:
            kSetDtId(@"31528", params)
            break;

        case TuWanTypeDuJia:
            kSetClass(@"heronews", params)
            kSetMod(@"八卦", params)
            kRemoveClassMore(params)
            break;

        case TuWanTypeGongLve:
    kSetDtId(@"83623,31528,31537,31538,57067,91821", params)
            kRemoveClassMore(params)
            [params setObject:@"guide" forKey:@"type"];

            break;
        default:
            kSetMod(@"美女", params)
            kSetClass(@"heronews", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
    }
    NSString *path=[TuWanNetManager percentPathWithPath:kTuWanPath params:params];
  return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
      completionHandle([TuWanModel objectWithKeyValues:responseObj],error);
    }];
    
   }

+(id)getTuWanDetailPicWithAid:(NSString *)aid kCompletionHandle{
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithDictionary:@{@"aid":aid,kAppId}];
    NSString *path=[self percentPathWithPath:@"http://api.tuwan.com/app/" params:params];
  return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
      //picture
      //这里一定要用firstObject来取，因为用[0]来取，容易出现越界，如果数组为空，而firstObject就返回的是nil
      
        completionHandle([TuWanPicModel objectArrayWithKeyValuesArray:responseObj].firstObject,error);
      
         }];
}
+(id)getTuWanDetailVideoWithAid:(NSString *)aid kCompletionHandle{
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithDictionary:@{@"aid":aid,kAppId}];
    NSString *path=[self percentPathWithPath:@"http://api.tuwan.com/app/" params:params];
 return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
    completionHandle([TuWanVideoModel objectArrayWithKeyValuesArray:responseObj].firstObject,error);
     
 }];

}
@end
