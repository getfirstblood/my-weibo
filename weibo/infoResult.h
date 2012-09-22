//
//  infoResult.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "infoData.h"
@interface infoResult : NSObject{
    NSString                *ret_;
    NSString                *msg_;
    NSString                *errCode_;
    infoData                *data_;
}
@property (nonatomic, copy) NSString                *ret;
@property (nonatomic, copy) NSString                *msg;
@property (nonatomic, copy) NSString                *errCode;
@property (nonatomic, retain) infoData                *data;
@end
