//
//  Result.h
//  tabbar
//
//  Created by 伟伟 高 on 4/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"

@interface Result : NSObject {
    NSString        *ret_;
    NSString        *msg_;
    NSString        *errCode_;
    Data            *data_;
}
@property (nonatomic, copy) NSString        *ret;
@property (nonatomic, copy) NSString        *msg;
@property (nonatomic, copy) NSString        *errCode;
@property (nonatomic, retain) Data          *data;
@end
