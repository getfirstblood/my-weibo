//
//  Time_line.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-13.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessModuleProtocol.h"
#import "TimeLine_Network.h"
@class BusinessFramework;
@interface Time_line : NSObject<BusinessModuleProtocol>{
    TimeLine_Network                *network_;
    BusinessFramework               *businessFramework_;
    TimeLine_Network                *mentionNetwork_;
    NSMutableDictionary             *imageDownloads_;
    NSMutableDictionary             *collectImageDowns_;
    NSMutableDictionary             *mentionImageDowns_;
    TimeLine_Network                *headnetwork_;
}
@property (nonatomic, retain)BusinessFramework      *businessFrmamework;
@property (nonatomic, retain)TimeLine_Network       *network;
@property (nonatomic, retain)TimeLine_Network       *mentionNetwork;
@property (nonatomic, retain)NSMutableDictionary    *imageDownloads;
@property (nonatomic, retain)NSMutableDictionary    *collectImageDowns;
@property (nonatomic, retain)NSMutableDictionary    *mentionImageDowns;
@property (nonatomic, retain)TimeLine_Network       *headnetwork;
@end
