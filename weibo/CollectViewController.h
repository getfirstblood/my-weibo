//
//  CollectViewController.h
//  tabbar
//
//  Created by ji jijiandong on 12-5-24.
//  Copyright 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessListenerProtocol.h"
#import "Result.h"
#import "Info.h"
@interface CollectViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,BusinessListenerProtocol,UIScrollViewDelegate>{
    UITableView *collectView_;    //收藏列表
    NSMutableArray  *cellInfoArr_;      //用户信息数组
    Result          *ret_;
    NSInteger       index_;             //tableview点击row的索引
    UIActivityIndicatorView         *activity_;
}

@property (nonatomic, retain) IBOutlet UITableView *collectView;
@property (nonatomic, retain) NSMutableArray *cellInfoArr;
@property (nonatomic, retain) Result        *ret;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView   *activity;

@end
