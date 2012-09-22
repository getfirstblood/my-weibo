//
//  BusinessFramework.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessModuleProtocol.h"
#import "BusinessListenerProtocol.h"
//业务框架，用于分发业务事件和获取业务数据
@interface BusinessFramework : NSObject {
    @private
    NSMutableDictionary         *businessModuleDict_;
    NSMutableArray              *businessListenerArray_;
}
//获取默认的业务框架句柄
+ (id)defaultBusinessFramework;
//释放默认的业务框架句柄
+ (void)releaseBusinessFramework;
//初始化
- (id)init;
//注册业务模块
- (void)registerBusinessModule:(id<BusinessModuleProtocol>)businessModule;
//注册业务事件监听对象
- (void)registerBusinessListener:(id<BusinessListenerProtocol>)businessListener;
//取消业务事件监听对象
- (void)unregisterBusinessListener:(id<BusinessListenerProtocol>)businessListener;
//广播
- (void)broadcastBusinessListener:(int)notificationId withInparam:(id)inParam;
//调用某个具体业务处理，需要返回参数
- (int)callBusinessProcess:(int)funcId withInParam:(id)inParam andOutParam:(id)outParam;
//调用某个具体业务处理,bu要返回参数
- (int)callBusinessProcess:(int)funcId withInParam:(id)inParam;
@end
