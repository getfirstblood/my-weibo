//
//  Data_store.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "Data_store.h"
#import "ModuleTypeDef.h"
#import "tabbarAppDelegate.h"
#import "QWeiboAsyncApi.h"
#import "BusinessFramework.h"

@interface Data_store(InternelMethod)
- (void)addtWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)list_tWithInParam:(id)inParam andOutParam:(id)outParam;
@end


@implementation Data_store
@synthesize businessFrmamework = businessFramework_;
@synthesize network = network_;
@synthesize listNetwork = listNetwork_;
- (int)initBusinessProcess:(BusinessModuleInfo *)info
{
    self.businessFrmamework = info.businessFramework;
    info.businessModuleId = data_Store;
    return 0;
}
- (int)callBusinessProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id)outParam
{
    switch (capabilityId) {
        case addt:{
            [self addtWithInParam:inParam andOutParam:outParam];
        }
            break;
        case delt:{
            
        }
            break;
        case list_t:{
            [self list_tWithInParam:inParam andOutParam:outParam];
        }
            break;
        default:{
            
        }
            break;
    }
    return 0;
}
- (void)addtWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.network = [[[TimeLine_Network alloc] init] autorelease];
    self.network.capability = MakeID(data_Store, addt);
    [network_ startDownLoadWithInParam:inParam andOutParam:outParam];
}
- (void)list_tWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.listNetwork = [[[TimeLine_Network alloc] init] autorelease];
    self.listNetwork.capability = MakeID(data_Store, list_t);
    [listNetwork_ startDownLoad];
}
- (void)dealloc
{
    [businessFramework_ release];
    [network_ release];
    [listNetwork_ release];
    [super dealloc];
}
@end
