//
//  Music.h
//  tabbar
//
//  Created by 伟伟 高 on 4/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Music : NSObject {
    NSString            *author_;
    NSString            *url_;
    NSString            *title_;
}
@property (nonatomic, copy) NSString        *author;
@property (nonatomic, copy) NSString        *url;
@property (nonatomic, copy) NSString        *title;
@end
