//
//  HomePage.h
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessListenerProtocol.h"
#import "Result.h"
#import "Info.h"
@interface HomePage : UIViewController <UITableViewDataSource,UITableViewDelegate,BusinessListenerProtocol> {
    
    UITableView     *broadcastView_;    //微博动态
    //NSMutableArray  *cellInfoArr_;      //用户信息数组
    NSInteger       index_;             //tableview点击row的索引
    Result          *ret_;
    UIActivityIndicatorView         *activity_;
}

@property (nonatomic, retain) IBOutlet UITableView *broadcastView;
//@property (nonatomic, retain) NSMutableArray *cellInfoArr;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, retain) Result    *ret;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView   *activity;

//- (NSInteger)getRowAtIndex;

@end
