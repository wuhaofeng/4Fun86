//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by ios on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
@interface TuWanPicViewModel : BaseViewModel
/**必须使用下方的初始化方法*/
-(id)initWithAid:(NSString * )aid;
@property(nonatomic,strong) NSString * aid;
/**aid的复制应该是非空的，使用xcode7新加入的非空标志*/
@property(nonatomic)NSInteger rowNumber;
-(NSURL *)picURLForRow:(NSInteger)row;
@property(nonatomic,strong)TuWanPicModel *picModel;
@end
