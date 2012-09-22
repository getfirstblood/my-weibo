//
//  HomePageParse.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-5.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Result.h"
#import "Data.h"
#import "Info.h"
#import "Video.h"
#import "Music.h"
@protocol ParseOperationDelegate <NSObject>
- (void)didFinishParsing:(Result *)result;
- (void)parseErrorOccurred:(NSError *)error;
@end

@interface HomePageParse : NSOperation <NSXMLParserDelegate>
{
    id<ParseOperationDelegate>          delegate_;
    NSData                              *dataToParse_;
//    NSMutableArray                      *workingArray_;
//    weiboRecord                         *workingEntry_;
    NSMutableString                     *workingPropertyString_;
    Result                              *resultObject_;
    Data                                *dataObject_;
    Info                                *infoObject_;
    Info                                *sourceObject_;
    Video                               *videoObject_;
    Music                               *musicObject_;
    NSMutableDictionary                 *userObject_;
//    NSArray                             *elementsToParse_;
    NSArray                             *resultsToParse_;
    NSArray                             *daToParse_;
    NSArray                             *infoToParse_;
    NSArray                             *musicToParse_;
    NSArray                             *videoToParse_;
    BOOL                                storingCharacterData_;
    BOOL                                result_;
    BOOL                                data_;
    BOOL                                info_;
    BOOL                                music_;
    BOOL                                video_;
    BOOL                                user_;
    int                                 capability_;
}
@property (nonatomic, assign) id<ParseOperationDelegate> delegate;
@property (nonatomic, retain) NSData                     *dataToParse;
//@property (nonatomic, retain) NSMutableArray            *workingArray;
//@property (nonatomic, retain) weiboRecord               *workingEntry;
@property (nonatomic, retain) NSMutableString           *workingPropertyString;
@property (nonatomic, retain) Result                    *resultObject;
@property (nonatomic, retain) Data                      *dataObject;
@property (nonatomic, retain) Info                      *infoObject;
@property (nonatomic, retain) Info                      *sourceObject;
@property (nonatomic, retain) Video                     *videoObject;
@property (nonatomic, retain) Music                     *musicObject;
@property (nonatomic, retain) NSMutableDictionary       *userObject;
//@property (nonatomic, retain) NSArray                   *elementsToParse;
@property (nonatomic, retain) NSArray                   *resultsToParse;
@property (nonatomic, retain) NSArray                   *daToParse;
@property (nonatomic, retain) NSArray                   *infoToParse;
@property (nonatomic, retain) NSArray                   *musicToParse;
@property (nonatomic, retain) NSArray                   *videoToParse;
@property (nonatomic, assign) BOOL                      storingCharacterData;
@property (nonatomic, assign) BOOL                      result;
@property (nonatomic, assign) BOOL                      data;
@property (nonatomic, assign) BOOL                      info;
@property (nonatomic, assign) BOOL                      music;
@property (nonatomic, assign) BOOL                      video;
@property (nonatomic, assign) BOOL                      user;
@property (nonatomic, assign) int                       capability;
- (id)initWithData:(NSData *)data delegate:(id <ParseOperationDelegate>)theDelegate;
@end
