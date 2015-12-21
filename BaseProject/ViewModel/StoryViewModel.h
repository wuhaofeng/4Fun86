//
//  StoryViewModel.h
//  BaseProject
//
//  Created by ios on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface StoryViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
-(NSURL *)avatarUrlForRow:(NSInteger)row;
-(NSString *)nameForRow:(NSInteger)row;
-(NSString*)textForRow:(NSInteger)row;
-(NSString*)categoryNameForRow:(NSInteger)row;
-(NSString *)diggCountForRow:(NSInteger)row;
-(NSString *)buryCountForRow:(NSInteger)row;
-(NSString *)commentCountForRow:(NSInteger)row;
-(NSString *)shareCountForRow:(NSInteger)row;
@property(nonatomic)NSInteger  minTime;
-(NSURL *)shareUrlForRow:(NSInteger)row;
@end
