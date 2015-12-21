//
//  ImageViewModel.m
//  BaseProject
//
//  Created by soft on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ImageViewModel.h"
#import "StoryImageNetManager.h"
#import "StoryImageModel.h"
#define kImageMinTime @"1447478180"
#define kImageMaxTime @"1447478480"

@implementation ImageViewModel

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [StoryImageNetManager getMinTime:kImageMinTime CompletionHandle:^(StoryImageModel *model, NSError *error) {
        if(model){
        [self.dataArr removeAllObjects];
        [self.dataArr addObject:model];
        self.model = model.data;
        completionHandle(error);
        }
        else
            completionHandle(error);
    }];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.dataTask = [StoryImageNetManager getMaxTime:kImageMaxTime CompletionHandle:^(StoryImageModel* model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObject:model];
        self.model = model.data;
        self.dataDate=[[NSMutableArray alloc]initWithArray:self.model.data];
        for (StoryImageDataDataModel *dataModel in self.dataDate) {
            if (![dataModel.type isEqualToNumber:@1]) {
                [self.dataDate removeObject:dataModel];
            }
        }
         self.model.data=[self.dataDate copy];
        completionHandle(error);
    }];
}

- (NSInteger)rowNumber{
    return self.model.data.count;
}

- (StoryImageDataDataModel *)modelForRow:(NSInteger)row{
    return self.model.data[row];
}

- (StoryImageDataDataGroupModel *) dataDataGroupModelForRow:(NSInteger)row{
    return [self modelForRow:row].group;
}

- (GroupUser2Model *) groupUserModelForRow:(NSInteger)row{
    return [self dataDataGroupModelForRow:row].user;
}


- (NSURL *)userIVURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self groupUserModelForRow:row].avatarUrl];
}

- (NSString *) userNameForRow:(NSInteger)row{
    return [self groupUserModelForRow:row].name;
}

- (NSString *) cateNameForRow:(NSInteger)row{
    return [self dataDataGroupModelForRow:row].categoryName;
}
//图片链接
- (NSURL *) contentIVURLForRow:(NSInteger)row{
    /** 不是组图时 */
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://p3.pstatp.com/%@",[self dataDataGroupModelForRow:row].largeImage.uri]];
}

- (NSString *) digForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"顶 %.0lf",[self dataDataGroupModelForRow:row].diggCount];
}

- (NSString *) buryForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"踩 %.0lf",[self dataDataGroupModelForRow:row].buryCount];
}
- (NSString *) shareForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"分享 %.0lf",[self dataDataGroupModelForRow:row].shareCount];
}
- (NSString *) favouriteForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"最爱 %.0lf",[self dataDataGroupModelForRow:row].favoriteCount];
}

- (NSString *)contentForRow:(NSInteger)row{
    return [self dataDataGroupModelForRow:row].content;
}

- (NSURL *)nextPageURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataDataGroupModelForRow:row].shareUrl];
}

@end
