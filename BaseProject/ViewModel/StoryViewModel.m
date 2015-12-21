//
//  StoryViewModel.m
//  BaseProject
//
//  Created by ios on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryViewModel.h"
#import "StoryNetManager.h"
#import "StoryModel.h"
@implementation StoryViewModel
-(NSInteger)rowNumber{

    return self.dataArr.count;
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _minTime+=1;
    [self getDataFromNetCompleteHandle:completionHandle];

}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _minTime=1447327361;
    [self getDataFromNetCompleteHandle:completionHandle];
   
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[StoryNetManager getMinTime:@(self.minTime).stringValue CompletionHandle:^(StoryModel *model, NSError *error) {
        if (_minTime==1447327361) {
        [self.dataArr removeAllObjects];
    }
        
            [self.dataArr addObjectsFromArray:model.data.data];
        for (int i=0;i<self.rowNumber;i++) {
            StoryDataDataModel *model=self.dataArr[i];
            if ([model.group.text isEqualToString:@""]) {
                [self.dataArr removeObjectAtIndex:i];
            }
        }
        completionHandle(error);
    }];
    
}
-(StoryDataDataModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSURL *)avatarUrlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].group.user.avatarUrl];

}
-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].group.user.name;

}
-(NSString*)textForRow:(NSInteger)row{
    return [self modelForRow:row].group.text;

}
-(NSString*)categoryNameForRow:(NSInteger)row{
    return [self modelForRow:row].group.categoryName;
}
-(NSString *)diggCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"赞 %ld",(NSInteger)[self modelForRow:row].group.diggCount];
}
-(NSString *)buryCountForRow:(NSInteger)row{

return [NSString stringWithFormat:@"踩 %ld",(NSInteger)[self modelForRow:row].group.diggCount];
}
-(NSString *)commentCountForRow:(NSInteger)row{
return [NSString stringWithFormat:@"评论 %ld",(NSInteger)[self modelForRow:row].group.commentCount];
}
-(NSString *)shareCountForRow:(NSInteger)row{
return [NSString stringWithFormat:@"转发 %ld",(NSInteger)[self modelForRow:row].group.shareCount];

}
-(NSURL *)shareUrlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].group.shareUrl];

}
@end
