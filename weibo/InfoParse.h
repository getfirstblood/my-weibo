//
//  InfoParse.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "infoResult.h"
#import "infoData.h"
#import "infoTag.h"
#import "infoEdu.h"
@interface InfoParse : NSOperation<NSXMLParserDelegate>{
    NSData                              *dataToParse_;
    //    NSMutableArray                      *workingArray_;
    //    weiboRecord                         *workingEntry_;
    NSMutableString                     *workingPropertyString_;
    infoResult                          *ioResult_;
    infoData                            *ioData_;
    infoTag                             *ioTag_;
    infoEdu                             *ioEdu_;
    NSArray                             *ioResultToParse_;
    NSArray                             *ioDataToParse_;
    NSArray                             *ioTagToParse_;
    NSArray                             *ioEduToParse_;
    BOOL                                storingCharacterData_;
    BOOL                                result_;
    BOOL                                data_;
    BOOL                                tag_;
    BOOL                                edu_;
}
@property (nonatomic, retain) NSData            *dataToParse;
@property (nonatomic, retain) NSMutableString   *workingPropertyString;
@property (nonatomic, retain) infoResult        *ioResult;
@property (nonatomic, retain) infoData          *ioData;
@property (nonatomic, retain) infoTag           *ioTag;
@property (nonatomic, retain) infoEdu           *ioEdu;
@property (nonatomic, retain) NSArray           *ioResultToParse;
@property (nonatomic, retain) NSArray           *ioDataToParse;
@property (nonatomic, retain) NSArray           *ioTagToParse;
@property (nonatomic, retain) NSArray           *ioEduToParse;
@property (nonatomic, assign) BOOL              storingCharacterData;
@property (nonatomic, assign) BOOL              result;
@property (nonatomic, assign) BOOL              data;
@property (nonatomic, assign) BOOL              tag;
@property (nonatomic, assign) BOOL              edu;
- (id)initWithData:(NSData *)data;
@end
