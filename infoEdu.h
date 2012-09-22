//
//  infoEdu.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface infoEdu : NSObject{
    NSString                *infoid_;
    NSString                *year_;
    NSString                *schoolid_;
    NSString                *departmentid_;
    NSString                *level_;
}
@property (nonatomic, copy) NSString                *infoid;
@property (nonatomic, copy) NSString                *year;
@property (nonatomic, copy) NSString                *schoolid;
@property (nonatomic, copy) NSString                *departmentid;
@property (nonatomic, copy) NSString                *level;
@end
