//
//  Mention.h
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageParse.h"
#import "Result.h"
#import "BusinessListenerProtocol.h"
@interface Mention : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,ParseOperationDelegate,BusinessListenerProtocol>{
    NSMutableArray  *weiboRecords_;     //解析后的用于显示的对象集合
    UITableView     *recordTable_;      //微薄表视图
    Result          *result_;
    UIButton        *updateButton_;
    UIActivityIndicatorView     *activity_;
    NSInteger       index_;             //tableview点击row的索引
}
@property (nonatomic, retain) NSMutableArray    *weiboRecords;
@property (nonatomic, retain) IBOutlet UITableView *recordTable;
@property (nonatomic, retain) Result            *result;
@property (nonatomic, retain) UIButton          *updateButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView   *activity;
@property (nonatomic, assign) NSInteger index;
- (void)update:(id)sender;
- (void)write:(id)sender;
@end
