//
//  MentionDetailsViewController.h
//  tabbar
//
//  Created by ji jijiandong on 12-5-21.
//  Copyright 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessListenerProtocol.h"
#import "Result.h"
@class HomePage;

@interface MentionDetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BusinessListenerProtocol>{
    UIButton *headBtn_;         //提及细节视图主人头像
    UILabel  *nameLabel_;       //提及细节视图主人姓名
    UIButton *transmitBtn_;     //提及细节视图转播按钮
    UIButton *commentBtn_;      //提及细节视图评论按钮
    UIButton *moreBtn_;         //提及细节视图更多按钮
    UITableView *mentionView_;  //提及细节视图内容和评论视图
    HomePage *mention_;         //homePage的实例
    Result  *ret_;
    UIActivityIndicatorView *active_;
}

@property (nonatomic, retain) IBOutlet UIButton *headBtn;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UIButton *transmitBtn;
@property (nonatomic, retain) IBOutlet UIButton *commentBtn;
@property (nonatomic, retain) IBOutlet UIButton *moreBtn;
@property (nonatomic, retain) IBOutlet UITableView *mentionView;
@property (nonatomic, retain) HomePage *mention;
@property (nonatomic, retain) Result    *ret;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *active;
- (IBAction)headBtnClicked;
- (IBAction)transmitBtnClicked;
- (IBAction)commentBtnClicked;
- (IBAction)moreBtnClicked;
- (void)set:(HomePage *)mention;
- (void)head;

@end
