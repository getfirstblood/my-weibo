//
//  WeiboRelation.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-13.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessModuleProtocol.h"
#import "BusinessFramework.h"
#import "TimeLine_Network.h"
@interface WeiboRelation : NSObject<BusinessModuleProtocol>
{
    BusinessFramework               *businessFramework_;
    TimeLine_Network                *network_;
    TimeLine_Network                *reListNetwork_;
    TimeLine_Network                *reAddNetwork_;
    TimeLine_Network                *commentNetwork_;
}
@property (nonatomic, retain)BusinessFramework      *businessFramework;
@property (nonatomic, retain)TimeLine_Network       *network;
@property (nonatomic, retain)TimeLine_Network       *reListNetwork;
@property (nonatomic, retain)TimeLine_Network       *reAddNetwork;
@property (nonatomic, retain)TimeLine_Network       *commentNetwork;
@end
