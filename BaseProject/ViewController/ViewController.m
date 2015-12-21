//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "StoryViewModel.h"
#import "StoryCell.h"
#import "StoryDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AVSpeechSynthesizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)StoryViewModel *storyVM;
@property(nonatomic,strong)StoryDetailViewController *vc;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)AVSpeechSynthesizer *spe;
@end

@implementation ViewController
-(UIButton *)button{
    if (!_button) {
        _button=[UIButton buttonWithType:0];
    }
    return _button;
}
-(AVSpeechSynthesizer *)spe{
    _spe=nil;
    if (!_spe) {
        _spe=[AVSpeechSynthesizer new];
        _spe.delegate=self;
    }
    return _spe;
}
-(StoryViewModel *)storyVM{
    if (!_storyVM) {
        _storyVM=[StoryViewModel new];
    }
    return  _storyVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.storyVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableView reloadData];
            [_tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.storyVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView reloadData];
            [_tableView.footer endRefreshing];
        }];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.storyVM.rowNumber;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StoryCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellStyleDefault;
    [cell.iconIV setImageWithURL:[self.storyVM avatarUrlForRow:indexPath.section]];
    cell.nameLB.text=[self.storyVM nameForRow:indexPath.section];
    cell.textLB.text=[self.storyVM textForRow:indexPath.section];
    cell.categoryNameLB.text=[self.storyVM categoryNameForRow:indexPath.section];
    cell.categoryNameLB.layer.cornerRadius=4;
    cell.categoryNameLB.layer.borderColor = [UIColor greenSeaColor].CGColor;
    cell.categoryNameLB.layer.borderWidth = 2.0;
    cell.categoryNameLB.textColor=[UIColor greenSeaColor];
    cell.diggCountLB.text=[self.storyVM diggCountForRow:indexPath.section];
    cell.buryCountLB.text=[self.storyVM buryCountForRow:indexPath.section];
    cell.commentCountLB.text=[self.storyVM commentCountForRow:indexPath.section];
    cell.shareCountLB.text=[self.storyVM shareCountForRow:indexPath.section];
    self.button=(UIButton *)[cell.contentView viewWithTag:100];
    self.button.layer.borderColor=[UIColor greenSeaColor].CGColor;
    self.button.layer.borderWidth=2.0;
    self.button.layer.cornerRadius=8;
    //加入朗读功能
    [self.button bk_addEventHandler:^(id sender) {
        if (self.spe.speaking) {
            [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
            return ;
        }
        AVSpeechUtterance *utt=[AVSpeechUtterance speechUtteranceWithString:cell.textLB.text];
        NSLog(@"%@",cell.textLB.text);
        utt.voice=[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        [self.spe speakUtterance:utt];
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    return cell;

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.spe stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];

}
//设置自动适配行高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//用于传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.vc.shareUrl=[self.storyVM shareUrlForRow:indexPath.section];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath*)indexPath{
    StoryDetailViewController *vc= segue.destinationViewController;
    self.vc=vc;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
