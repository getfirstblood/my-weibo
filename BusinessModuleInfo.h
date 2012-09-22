//
//  BusinessModuleInfo.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

@class BusinessFramework;

@interface BusinessModuleInfo : NSObject {
    
//@private
    
    int businessModuleId_;
    
    BusinessFramework* businessFramework_;
}

@property(nonatomic, assign) int businessModuleId;
@property(nonatomic, assign) BusinessFramework* businessFramework;

- (id)init;
@end