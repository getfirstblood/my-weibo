//
//  GlobalObjectCenter.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-13.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "GlobalObjectCenter.h"
#import "Time_line.h"
#import "WeiboRelation.h"
#import "Data_store.h"
#import "BusinessFramework.h"
#import "AccountRelation.h"
static GlobalObjectCenter *g_GlobalObjectCenter = nil;
//static NSMutableDictionary *g_GlobalProgramConfiguration = nil;
@implementation GlobalObjectCenter
+ (GlobalObjectCenter *)defaultGlobalObjectCenter
{
    if(g_GlobalObjectCenter == nil)
    {
        g_GlobalObjectCenter = [[GlobalObjectCenter alloc] init];
    }
    return g_GlobalObjectCenter;
}
+ (void)releaseGlobalObjectCenter
{
    if(g_GlobalObjectCenter != nil){
        [g_GlobalObjectCenter release];
        g_GlobalObjectCenter = nil;
    }
}
+ (void)initBusinessModules
{
    BusinessFramework *framework =  [BusinessFramework defaultBusinessFramework];
    [framework registerBusinessModule:[[[Time_line alloc] init] autorelease]];
    [framework registerBusinessModule:[[[WeiboRelation alloc] init] autorelease]];
    [framework registerBusinessModule:[[[Data_store alloc] init] autorelease]];
    [framework registerBusinessModule:[[[AccountRelation alloc] init] autorelease]];
}
+ (void)exitBusinessModules
{
    [BusinessFramework releaseBusinessFramework];
}
+ (NSMutableDictionary *)globalProgrammConfiguration
{
    return nil;
}
+ (void)saveGlobalProgramConfiguration
{
    
}
- (void)dealloc
{
    [super dealloc];
}
@end
