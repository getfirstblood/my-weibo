//
//  AccountRelation.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-19.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "AccountRelation.h"
#import "ModuleTypeDef.h"
#import "tabbarAppDelegate.h"
#import "QWeiboAsyncApi.h"
#import "BusinessFramework.h"

@interface AccountRelation(InternelMethod)
- (void)getInfoWithInParam:(id)inParam andOutParam:(id)outParam;
@end

@implementation AccountRelation
@synthesize businessFrmamework = businessFramework_;
@synthesize network = network_;
- (int)initBusinessProcess:(BusinessModuleInfo *)info
{
    self.businessFrmamework = info.businessFramework;
    info.businessModuleId = account_Relation;
    return 0;
}
- (int)callBusinessProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id)outParam
{
    switch (capabilityId) {
        case info:{
            [self getInfoWithInParam:inParam andOutParam:outParam];
        }
            break;
        case update:{
            
        }
            break;
        default:{
            
        }
            break;
    }
    return 0;
}
- (void)getInfoWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.network = [[[TimeLine_Network alloc] init] autorelease];
    self.network.capability = MakeID(account_Relation, info);
    [network_ startDownLoad];
}
- (void)dealloc
{
    [businessFramework_ release];
    [network_ release];
    [super dealloc];
}
@end
