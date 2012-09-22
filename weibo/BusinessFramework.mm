//
//  BusinessFramework.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
#include <vector>
using namespace std;

static vector<id> listenerVector;
//未广播队列容器
static vector<vector<id> *> notbroadcastListenerVectorVec;
static BusinessFramework *g_defaultFramework = nil;

@implementation BusinessFramework
+ (id)defaultBusinessFramework
{
    if(g_defaultFramework == nil)
        g_defaultFramework = [[BusinessFramework alloc] init];
    return g_defaultFramework;
}
+ (void)releaseBusinessFramework
{
    if(g_defaultFramework)
    {
        [g_defaultFramework release];
        g_defaultFramework = nil;
    }
}
- (id)init
{
    self = [super init];
    if(self)
    {
        businessModuleDict_ = [[NSMutableDictionary alloc] initWithCapacity:10];
        businessListenerArray_ = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}
- (void)registerBusinessModule:(id<BusinessModuleProtocol>)businessModule
{
    BusinessModuleInfo *info = [[[BusinessModuleInfo alloc] init] autorelease];
    info.businessFramework = self;
    [businessModule initBusinessProcess:info];
    [businessModuleDict_ setValue:businessModule forKey:[NSString stringWithFormat:@"%d",info.businessModuleId]];
}
- (void)registerBusinessListener:(id<BusinessListenerProtocol>)businessListener
{
    listenerVector.push_back(businessListener);
    int vectorSize = notbroadcastListenerVectorVec.size();
    for (int i = 0;i < vectorSize; i++)
    {
        notbroadcastListenerVectorVec[i]->push_back(businessListener);
    }
}
- (void)unregisterBusinessListener:(id<BusinessListenerProtocol>)businessListener
{
    vector<id>::iterator iter;
    for (iter = listenerVector.begin(); iter != listenerVector.end(); iter++) {
        if(*iter == businessListener)
        {
            listenerVector.erase(iter);
            break;
        }
    }
    int stackSize = notbroadcastListenerVectorVec.size();
    for (int i = 0; i < stackSize; i++) {
        vector<id> *notbroadcastListenerVector = notbroadcastListenerVectorVec[i];
        vector<id>::iterator notbroadcastListenerVectorIter;
        for (notbroadcastListenerVectorIter = notbroadcastListenerVector->begin(); notbroadcastListenerVectorIter != notbroadcastListenerVector->end(); notbroadcastListenerVectorIter++) {
            if(*notbroadcastListenerVectorIter == businessListener){
                notbroadcastListenerVector->erase(notbroadcastListenerVectorIter);
                break;
            }
        }
    }
}
- (void)broadcastBusinessListener:(int)notificationId withInparam:(id)inParam
{
    vector<id>* notbroadcastlistenerVector = new vector<id>(listenerVector);
	notbroadcastListenerVectorVec.push_back(notbroadcastlistenerVector);
	
	while (notbroadcastlistenerVector->begin() != notbroadcastlistenerVector->end()) {
        
		id<BusinessListenerProtocol> listener = *notbroadcastlistenerVector->begin();
		notbroadcastlistenerVector->erase(notbroadcastlistenerVector->begin());
		[listener processBusinessNotify:notificationId withInParam:inParam];
	}
	notbroadcastListenerVectorVec.pop_back();
	delete notbroadcastlistenerVector;
	notbroadcastlistenerVector = NULL;
}
- (int)callBusinessProcess:(int)funcId withInParam:(id)inParam
{
    return [self callBusinessProcess:funcId withInParam:inParam andOutParam:nil];
}

- (int)callBusinessProcess:(int)funcId withInParam:(id)inParam andOutParam:(id)outParam
{
    NSString *key = [NSString stringWithFormat:@"%d",ModuleID(funcId)];
    id<BusinessModuleProtocol> module = [businessModuleDict_ valueForKey:key];
    if(module)
    {
        return [module callBusinessProcess:CapabilityID(funcId) withInParam:inParam andOutParam:outParam];
    }
    return  -1;
}
- (void)dealloc
{
    [businessModuleDict_ release];
    [businessListenerArray_ release];
    listenerVector.clear();
    [super dealloc];
}
@end
