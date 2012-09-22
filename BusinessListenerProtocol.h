//
//  BusinessListenerProtocol.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BusinessListenerProtocol <NSObject>
- (void)processBusinessNotify:(int)notifcationId withInParam:(id)inParam;
@end
