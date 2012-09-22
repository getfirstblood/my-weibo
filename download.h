//
//  download.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-27.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "infoResult.h"

@protocol headDownLoadDelegate;

@interface download : NSObject
{
    infoResult          *ret_;
    id<headDownLoadDelegate>        delegate_;
    NSMutableData           *data_;
    NSURLConnection     *imageConnection_;
}
@property (nonatomic, retain) infoResult    *ret;
@property (nonatomic, assign) id<headDownLoadDelegate> delegate;
@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) NSURLConnection *imageConnection;
- (void)startDownload;
- (void)cancelDownload;
@end
@protocol headDownLoadDelegate

- (void)appImageDidLoad;

@end