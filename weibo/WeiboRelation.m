//
//  WeiboRelation.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-13.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "WeiboRelation.h"
#import "ModuleTypeDef.h"
@interface WeiboRelation(internelMethod)
- (void)addWeiboWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)getReListWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)re_addWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)commentWithInParam:(id)inParam andOutParam:(id)outParam;
- (void)addpicWeiboWithInParam:(id)inParam andOutParam:(id)outParam;
@end


@implementation WeiboRelation
@synthesize businessFramework = businessFramework_;
@synthesize network = network_;
@synthesize reListNetwork = reListNetwork_;
@synthesize reAddNetwork = reAddNetwork_;
@synthesize commentNetwork = commentNetwork_;
- (int)initBusinessProcess:(BusinessModuleInfo *)info
{
    info.businessModuleId = weibo_Relation;
    self.businessFramework = info.businessFramework;
    return 0;
}
- (int)callBusinessProcess:(int)capabilityId withInParam:(id)inParam andOutParam:(id)outParam
{
    switch (capabilityId) {
        case add:{
            [self addWeiboWithInParam:inParam andOutParam:outParam];
        }
            break;
        case addpic:
        {
            [self addpicWeiboWithInParam:inParam andOutParam:outParam];
        }
            break;
        case del:{
            
        }
            break;
        case re_list:{
            [self getReListWithInParam:inParam andOutParam:outParam];
        }
            break;
        case re_add:{
            [self re_addWithInParam:inParam andOutParam:outParam];
        }
            break;
        case commentt:{
            [self commentWithInParam:inParam andOutParam:outParam];
        }
            break;
        default:{
            
        }
            break;
    }
    return 0;
}
- (void)addWeiboWithInParam:(id)inParam andOutParam:(id)outParam
{
    //发业务
    NSLog(@"success");
    self.network = [[[TimeLine_Network alloc] init] autorelease];
    self.network.capability = MakeID(weibo_Relation, add);
    [network_ startDownLoadWithInParam:inParam andOutParam:outParam];
}
- (void)getReListWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.reListNetwork = [[[TimeLine_Network alloc] init] autorelease];
    self.reListNetwork.capability = MakeID(weibo_Relation, re_list);
    [reListNetwork_ startDownLoadWithInParam:inParam andOutParam:nil];
}
- (void)re_addWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.reAddNetwork = [[[TimeLine_Network alloc] init] autorelease];
    self.reAddNetwork.capability = MakeID(weibo_Relation, re_add);
    [reAddNetwork_ startDownLoadWithInParam:inParam andOutParam:outParam];
}
- (void)commentWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.commentNetwork = [[[TimeLine_Network alloc] init] autorelease];
    self.commentNetwork.capability = MakeID(weibo_Relation, commentt);
    [commentNetwork_ startDownLoadWithInParam:inParam andOutParam:outParam];
}
- (void)addpicWeiboWithInParam:(id)inParam andOutParam:(id)outParam
{
    self.network = [[[TimeLine_Network alloc] init] autorelease];
    self.network.capability = MakeID(weibo_Relation, addpic);
    [network_ startDownLoadWithInParam:inParam andOutParam:outParam];
}
- (void)dealloc
{
    [businessFramework_ release];
    [network_ release];
    [reListNetwork_ release];
    [reAddNetwork_ release];
    [commentNetwork_ release];
    [super dealloc];
}
@end
