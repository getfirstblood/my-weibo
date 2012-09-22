//
//  Data.h
//  tabbar
//
//  Created by 伟伟 高 on 4/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject {
    NSString                *timeStamp_;
    NSString                *hasNext_;
    NSMutableArray          *infos_;
    NSMutableDictionary     *user_;
}
@property (nonatomic, copy) NSString            *timeStamp;
@property (nonatomic, copy) NSString            *hasNext;
@property (nonatomic, retain) NSMutableArray        *infos;
@property (nonatomic, retain) NSMutableDictionary   *user;
@end
