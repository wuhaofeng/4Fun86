//
//  ImageViewModel.h
//  BaseProject
//
//  Created by soft on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "StoryImageModel.h"

@interface ImageViewModel : BaseViewModel

@property (nonatomic,strong) StoryImageDataModel *model;
@property (nonatomic) NSInteger rowNumber;
/** 用户头像图片 */
- (NSURL *) userIVURLForRow:(NSInteger)row;
/** 用户姓名 */
- (NSString *) userNameForRow:(NSInteger)row;
/** 分类名称 */
- (NSString *) cateNameForRow:(NSInteger)row;
/** 图片URL */
- (NSURL *) contentIVURLForRow:(NSInteger)row;
/** 赞 */
- (NSString *) digForRow:(NSInteger)row;
/** 踩 */
- (NSString *) buryForRow:(NSInteger)row;
/** 分享 */
- (NSString *) shareForRow:(NSInteger)row;
/** 最爱 */
- (NSString *) favouriteForRow:(NSInteger)row;
/** 内容 */
- (NSString *) contentForRow:(NSInteger)row;
/** 跳向下一页的URL */
- (NSURL *) nextPageURLForRow:(NSInteger)row;
@property(nonatomic,strong)NSMutableArray *dataDate;
@end
