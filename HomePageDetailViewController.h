//
//  HomePageDetailViewController.h
//  tabbar
//
//  Created by ji jijiandong on 12-5-24.
//  Copyright 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Mention;
#import "BusinessListenerProtocol.h"
#import "Result.h"

@interface HomePageDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BusinessListenerProtocol>{
    UIButton *headBtn_;         //主页细节视图主人头像
    UILabel  *nameLabel_;       //主页细节视图主人姓名
    UIButton *transmitBtn_;     //主页细节视图转播按钮
    UIButton *commentBtn_;      //主页细节视图评论按钮
    UIButton *moreBtn_;         //主页细节视图更多按钮
    UITableView *homeView_;  //主页细节视图内容和评论视图
    Mention *home_;             //homePage的实例
    Result  *ret_;
    UIActivityIndicatorView *active_;
}


@property (nonatomic, retain) IBOutlet UIButton *headBtn;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UIButton *transmitBtn;
@property (nonatomic, retain) IBOutlet UIButton *commentBtn;
@property (nonatomic, retain) IBOutlet UIButton *moreBtn;
@property (nonatomic, retain) IBOutlet UITableView *homeView;
@property (nonatomic, retain) Mention *home;
@property (nonatomic, retain) Result   *ret;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView  *active;
- (IBAction)headBtnClicked;
- (IBAction)transmitBtnClicked;
- (IBAction)commentBtnClicked;
- (IBAction)moreBtnClicked;
- (void)head;
@end
