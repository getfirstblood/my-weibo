//
//  BusinessModuleInfo.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "BusinessModuleInfo.h"


@implementation BusinessModuleInfo
@synthesize businessModuleId = businessModuleId_;
@synthesize businessFramework = businessFramework_;

- (id)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc{
    [businessFramework_ release];
    [super dealloc];
}

@end
