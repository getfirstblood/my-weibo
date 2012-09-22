//
//  TimeLine_Network.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-16.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleTypeDef.h"
#import "Info.h"
#import "infoResult.h"
@interface TimeLine_Network : NSObject{
    NSMutableData           *weiboListData_;
    NSURLConnection         *connection_;
    NSOperationQueue        *queue_;
    NSIndexPath             *indexPathInTableView_;
    Info                    *infoRecord_;
    int                     capability_;
    NSString                *tag_;
    infoResult              *inforesult_;
}
@property (nonatomic, retain) NSMutableData     *weiboListData;
@property (nonatomic, retain) NSURLConnection   *connection;
@property (nonatomic, retain) NSOperationQueue  *queue;
@property (nonatomic, retain) NSIndexPath       *indexPathInTableView;
@property (nonatomic, retain) Info              *infoRecord;
@property (nonatomic, assign) int               capability;
@property (nonatomic, copy) NSString            *tag;
@property (nonatomic, retain) infoResult        *inforesult;
- (void)startDownLoad;
- (void)cancelDownLoad;
- (void)startDownLoadWithInParam:(id)inParam andOutParam:(id)outParam;
@end
