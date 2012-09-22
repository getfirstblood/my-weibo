//
//  Information.h
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infoResult.h"
#import "download.h"
#import "BusinessListenerProtocol.h"
@interface Information: UIViewController <UITableViewDataSource,UITableViewDelegate,BusinessListenerProtocol,headDownLoadDelegate> {
    UIImageView *headImage_;   //主人头像
    UILabel *nameLabel_;       //主人姓名
    UIButton *editBtn_;        //编辑按钮
    UIButton *broadcastBtn_;   //广播按钮
    UIButton *listenerBtn_;    //听众按钮
    UIButton *attentionBtn_;   //收听按钮
    UIButton *topicBtn_;      //话题按钮
    UITableView *infoView_;   //信息视图
    NSMutableArray *infoArr_;  //tableView列表
    infoResult          *ret_;
    download *down_;
}

@property (nonatomic, retain) IBOutlet UIImageView *headImage;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UIButton *editBtn;
@property (nonatomic, retain) IBOutlet UIButton *broadcastBtn;
@property (nonatomic, retain) IBOutlet UIButton *listenerBtn;
@property (nonatomic, retain) IBOutlet UIButton *attentionBtn;
@property (nonatomic, retain) IBOutlet UIButton *topicBtn;
@property (nonatomic, retain) IBOutlet UITableView *infoView;
@property (nonatomic, retain) NSMutableArray *infoArr;
@property (nonatomic, retain) infoResult        *ret;
@property (nonatomic, retain) download      *down;
- (IBAction)editBtnClick;
- (IBAction)broadcastBtnClick;
- (IBAction)listenersBtnClick;
- (IBAction)attentionBtnClick;
- (IBAction)topicBtnClick;
- (void)head;
@end
