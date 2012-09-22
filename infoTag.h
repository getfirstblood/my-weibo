//
//  infoTag.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface infoTag : NSObject{
    NSString                *infoid_;
    NSString                *name_;
}
@property (nonatomic, copy) NSString      *infoid;
@property (nonatomic, copy) NSString      *name;
@end
