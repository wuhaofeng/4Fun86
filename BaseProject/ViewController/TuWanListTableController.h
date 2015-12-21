//
//  TuWanListTableController.h
//  BaseProject
//
//  Created by ios on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListTableController : UITableViewController
/**接受传参，决定当前控制器显示那种类型的信息*/
@property(nonatomic,strong)NSNumber *infoType;
@end
