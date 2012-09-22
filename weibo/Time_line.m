//
//  Time_line.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-13.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "Time_line.h"
#import "ModuleTypeDef.h"
#import "tabbarAppDelegate.h"
#import "QWeiboAsyncApi.h"
#import "BusinessFramework.h"
#import "Info.h"
@interface Time_line(InternelMethod)
- (void)getHomeTimeLineWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)getmentionsWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)getheadimageWithInParam:(id)inParam andOutParam:(id)outParam;
@end


@implementation Time_line
@synthesize headnetwork = headnetwork_;
@synthesize businessFrmamework = businessFramework_;
@synthesize network = network_;
@synthesize mentionNetwork = mentionNetwork_;
@synthesize imageDownloads = imageDownloads_;
@synthesize collectImageDowns = collectImageDowns_;
@synthesize mentionImageDowns = mentionImageDowns_;

- (int)initBusinessProcess:(BusinessModuleInfo *)info
{
    info.businessModuleId = time_line;
    self.businessFrmamework = info.businessFramework;
    self.imageDownloads = [NSMutableDictionary dictionary];
    self.collectImageDowns = [NSMutableDictionary dictionary];
    self.mentionImageDowns = [NSMutableDictionary dictionary];
    return 0;
}
- (int)callBusinessProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id)outParam
{
    switch (capabilityId) {
        case home_timeline:{
            [self getHomeTimeLineWithInParam:inParam andOutParam:outParam];
        }
            break;
        case user_timeline:{
            
        }
            break;
        case mentions_timeline:{
            [self getmentionsWithInParam:inParam andOutParam:outParam];
        }
            break;
        case headdownload:{
            [self getheadimageWithInParam:inParam andOutParam:outParam];
        }
            break;
        default:{
            
        }
            break;
    }
    return 0;
}
- (void)getHomeTimeLineWithInParam:(id)inParam andOutParam:(id)outParam
{
    //调用下载线程
    NSLog(@"success");
    self.network = [[[TimeLine_Network alloc] init] autorelease];
    self.network.capability = MakeID(time_line, home_timeline);
    [network_ startDownLoad];
}
- (void)getmentionsWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.mentionNetwork = [[[TimeLine_Network alloc] init] autorelease];
    self.mentionNetwork.capability = MakeID(time_line, mentions_timeline);
    [mentionNetwork_ startDownLoad];
}
- (void)getheadimageWithInParam:(id)inParam andOutParam:(id)outParam
{
    NSMutableDictionary *dic = (NSMutableDictionary *)inParam;
    NSIndexPath *path = [dic objectForKey:@"path"];
    Info *inforecord = [dic objectForKey:@"record"];
    infoResult *inforesult = [dic objectForKey:@"result"];
    NSString *class = [dic objectForKey:@"class"];
    if([class isEqualToString:@"homepage"])
    {
        TimeLine_Network *network = [imageDownloads_ objectForKey:path];
        if(network == nil)
        {
            network = [[TimeLine_Network alloc] init];
            network.infoRecord = inforecord;
            network.indexPathInTableView = path;
            network.tag = @"homepage";
            network.capability = MakeID(time_line, headdownload);
            [imageDownloads_ setObject:network forKey:path];
            [network startDownLoad];
            [network release];
        }
    }else if([class isEqualToString:@"collect"])
    {
        TimeLine_Network *network = [collectImageDowns_ objectForKey:path];
        if(network == nil)
        {
            network = [[TimeLine_Network alloc] init];
            network.infoRecord = inforecord;
            network.indexPathInTableView = path;
            network.tag = @"collect";
            network.capability = MakeID(time_line, headdownload);
            [collectImageDowns_ setObject:network forKey:path];
            [network startDownLoad];
            [network release];
        }
    }else if([class isEqualToString:@"mention"])
    {
        TimeLine_Network *network = [mentionImageDowns_ objectForKey:path];
        if(network == nil)
        {
            network = [[TimeLine_Network alloc] init];
            network.infoRecord = inforecord;
            network.indexPathInTableView = path;
            network.tag = @"mention";
            network.capability = MakeID(time_line, headdownload);
            [mentionImageDowns_ setObject:network forKey:path];
            [network startDownLoad];
            [network release];
        }
    }else if([class isEqualToString:@"info"])
    {
        TimeLine_Network *network = [[TimeLine_Network alloc] init];
        self.headnetwork = network;
        network.tag = @"info";
        network.inforesult = inforesult;
        network.capability = MakeID(time_line, headdownload);
        [network startDownLoad];
        [network release];
    }
}
- (void)dealloc
{
    [network_ release];
    [businessFramework_ release];
    [mentionNetwork_ release];
    [super dealloc];
}
@end
