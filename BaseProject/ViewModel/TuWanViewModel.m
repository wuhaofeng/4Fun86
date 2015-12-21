//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by ios on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
-(instancetype)initWithType:(TuWanType)type{
    if (self=[super init]) {
        self.type=type;
    }
    return self;
}

//预防性编程，防止不使用initWithType方法
-(id)init{
    if (self=[super init]) {
        //崩溃提示
        NSAssert1(NO, @"%s,必须使用initWithType初始化",__func__);
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[TuWanNetManager getTuWanInfoWithType:self.type start:self.start completionHandle:^(TuWanModel *model, NSError *error) {
        if (_start==0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr=nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr=model.data.indexpic;
        completionHandle(error);
    }];

}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start+=11;
    [self getDataFromNetCompleteHandle:completionHandle];

}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start=0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(BOOL)isExistIndexPic{
    return self.indexPicArr!=nil&&self.indexPicArr.count!=0;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;

}
-(NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}
-(TuWanDataIndexpicModel*)modelForArray:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}
/**根据showtype 0没有图 1 有图*/
-(BOOL)containImages:(NSInteger)row{
    return [[self modelForArray:self.dataArr row:row].showtype isEqualToString:@"1"];
}
-(NSString *)titleForRowInList:(NSInteger)row{
    return [self modelForArray:self.dataArr row:row].title;
}
-(NSString *)titleForRowInIndexPic:(NSInteger)row{
return [self modelForArray:self.indexPicArr row:row].title;

}
-(NSURL *)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArray:self.dataArr row:row].litpic];

}
/**返回列表中某行数据的描述*/
-(NSString*)descForRowInList:(NSInteger)row{
    return [self modelForArray:self.dataArr row:row].longtitle;

}
/**返回列表中某行数据的浏览人数*/
-(NSString*)clicksForRowInList:(NSInteger)row{
    return [[self modelForArray:self.dataArr row:row].click stringByAppendingString:@"人浏览"];

}
/**滚动展示栏的图片*/
-(NSURL *)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString: [self modelForArray:self.indexPicArr row:row].litpic];

}
/**滚动展示栏的文字*/
-(NSString*)descForRowInIndexPic:(NSInteger)row{
    return [self modelForArray:self.indexPicArr row:row].title;
}
/**获取列表中某行数据对应的html5链接*/
-(NSURL *)detailURLForRowInList:(NSInteger)row{
return [NSURL URLWithString:[self modelForArray:self.dataArr row:row].html5];
}
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArray:self.indexPicArr row:row].html5];
}
//返回
-(NSArray *)iconURLSForRowInList:(NSInteger)row{
    NSArray *arr=[self modelForArray:self.dataArr row:row].showitem;
    NSMutableArray *array=[NSMutableArray new];
    for (int i=0; i<arr.count; i++) {
        TuWanDataIndexpicShowitemModel *model=arr[i];
        [array  addObject:[NSURL URLWithString:model.pic]];
    }
    return [array copy];

}
/**当前数据类型是视频 video*/
-(BOOL)isVideoInListForRow:(NSInteger)row{
    return [[self modelForArray:self.dataArr row:row].type isEqualToString:@"video"];

}
-(BOOL)icVideoInIndexPicForRow:(NSInteger)row{
return [[self modelForArray:self.indexPicArr row:row].type isEqualToString:@"video"];

}
/**当前数据类型是图片 pic*/
-(BOOL)isPicInListForRow:(NSInteger)row{
return [[self modelForArray:self.dataArr row:row].type isEqualToString:@"pic"];
}
-(BOOL)isPicInIndexPicForRow:(NSInteger)row{
return [[self modelForArray:self.indexPicArr row:row].type isEqualToString:@"pic"];
}
/**当前数据类型是html all*/
-(BOOL)isHtmlInListForRow:(NSInteger)row{
return [[self modelForArray:self.dataArr row:row].type isEqualToString:@"all"];
}

-(BOOL)isHtmlInIndexPicForRow:(NSInteger)row{
return [[self modelForArray:self.indexPicArr row:row].type isEqualToString:@"all"];
}
/**返回某行数据的aid*/
-(NSString *)aidInListForRow:(NSInteger)row{
    return [self modelForArray:self.dataArr row:row].aid;

}
-(NSString *)aidInIndexPicForRow:(NSInteger)row{
    return [self modelForArray:self.indexPicArr row:row].aid ;

}
@end
