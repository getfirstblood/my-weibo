//
//  Info.h
//  tabbar
//
//  Created by 伟伟 高 on 4/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"
#import "Music.h"
@interface Info : NSObject {
    UIImage             *headImage_;
    NSString            *text_;
    NSString            *origtext_;
    NSString            *count_;
    NSString            *mcount_;
    NSString            *from_;
    NSString            *fromurl_;
    NSString            *id_;
    NSString            *image_;
    Video               *video_;
    Music               *music_;
    NSString            *name_;
    NSString            *openId_;
    NSString            *nick_;
    Info                *source_;
    NSString            *self_;
    NSString            *time_;
    NSString            *type_;
    NSString            *head_;
    NSString            *location_;
    NSString            *country_code_;
    NSString            *province_code_;
    NSString            *city_code_;
    NSString            *isvip_;
    NSString            *geo_;
    NSString            *status_;
    NSString            *emotion_;
    NSString            *emotiontype_;
}
@property (nonatomic, retain) UIImage               *headImage;
@property (nonatomic, copy) NSString                *text;
@property (nonatomic, copy) NSString                *origtext;
@property (nonatomic, copy) NSString                *count;
@property (nonatomic, copy) NSString                *mcount;
@property (nonatomic, copy) NSString                *from;
@property (nonatomic, copy) NSString                *fromurl;
@property (nonatomic, copy) NSString                *idtext;
@property (nonatomic, copy) NSString                *image;
@property (nonatomic, retain) Video                 *video;
@property (nonatomic, retain) Music                 *music;
@property (nonatomic, copy) NSString              *name;
@property (nonatomic, copy) NSString              *openId;
@property (nonatomic, copy) NSString              *nick;
@property (nonatomic, retain) Info                  *source;
@property (nonatomic, copy) NSString                *selftext;
@property (nonatomic, copy) NSString                *time;
@property (nonatomic, copy) NSString                *type;
@property (nonatomic, copy) NSString                *head;
@property (nonatomic, copy) NSString                *location;
@property (nonatomic, copy) NSString                *country_code;
@property (nonatomic, copy) NSString                *province_code;
@property (nonatomic, copy) NSString                *city_code;
@property (nonatomic, copy) NSString                *isvip;
@property (nonatomic, copy) NSString                *geo;
@property (nonatomic, copy) NSString                *status;
@property (nonatomic, copy) NSString                *emotion;
@property (nonatomic, copy) NSString                *emotiontype;
@end
