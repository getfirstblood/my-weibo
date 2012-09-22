//
//  HomePageParse.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-5.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "HomePageParse.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"

//static NSString *kIDStr         = @"id";
//static NSString *kNameStr       = @"im:name";
//static NSString *kImageStr      = @"im:image";
//static NSString *kArtistStr     = @"im:artist";
//static NSString *kEntryStr      = @"entry";
//result content
//static NSString *kResultStr     = @"result";
static NSString *KRetStr        = @"ret";
static NSString *kMsgStr        = @"msg";
static NSString *kErrCodeStr    = @"errcode";
//data content
static NSString *kDataStr       = @"data";
static NSString *kTimeStampStr   = @"timestamp";
static NSString *kHasNextStr    = @"hasnext";
//info content
#pragma mark info
static NSString *kInfoStr       = @"info";
static NSString *kTextStr       = @"text";
static NSString *kOrigtextStr   = @"origtext";
static NSString *kCountStr      = @"count";
static NSString *kMcount        = @"mcount";
static NSString *kFromStr       = @"from";
static NSString *kFromUrlStr    = @"fromurl";
static NSString *kIdStr         = @"id";
static NSString *kImageStr      = @"image";
static NSString *kNameStr       = @"name";
static NSString *kOpenIdStr     = @"openid";
static NSString *kNickStr       = @"nick";
static NSString *kSelfStr       = @"self";
//static NSString *kTimeStampStr  = @"timestamp";
static NSString *kTypeStr       = @"type";
static NSString *kHeadStr       = @"head";
static NSString *kLocationStr   = @"location";
static NSString *kCountry_codeStr   = @"country_code";
static NSString *kProvince_codeStr  = @"province_code";
static NSString *kCity_codeStr      = @"city_code";
static NSString *kIsvipStr          = @"isvip";
static NSString *kGeoStr            = @"geo";
static NSString *kStatusStr         = @"status";
static NSString *kEmotionUrlStr     = @"emotionurl";
static NSString *kEmotiontypeStr    = @"emotiontype";
//music content
static NSString *kMusicStr      = @"music";
static NSString *kAuthorStr     = @"author";
static NSString *kUrlStr        = @"url";
static NSString *kTitleStr      = @"title";
//video content
static NSString *kVideoStr      = @"video";
static NSString *kPicUrlStr     = @"picurl";
static NSString *kPlayerStr     = @"player";
static NSString *kRealUrlStr    = @"realurl";
static NSString *kShortUrlStr   = @"shorturl";
//static NSString *kTitleStr     = @"title";
//user 
static NSString *kUserStr       = @"user";
//source
static NSString     *kSourceStr     = @"source";

@implementation HomePageParse

@synthesize delegate=delegate_;
@synthesize dataToParse=dataToParse_;
//@synthesize workingArray=workingArray_;
//@synthesize workingEntry=workingEntry_;
@synthesize workingPropertyString=workingPropertyString_;
@synthesize resultObject = resultObject_;
@synthesize dataObject = dataObject_;
@synthesize infoObject = infoObject_;
@synthesize sourceObject = sourceObject_;
@synthesize musicObject = musicObject_;
@synthesize videoObject = videoObject_;
@synthesize userObject = userObject_;
//@synthesize elementsToParse=elementsToParse_;
@synthesize daToParse = daToParse_;
@synthesize resultsToParse = resultsToParse_;
@synthesize infoToParse = infoToParse_;
@synthesize musicToParse = musicToParse_;
@synthesize videoToParse = videoToParse_;
@synthesize storingCharacterData=storingCharacterData_;
@synthesize result = result_;
@synthesize data = data_;
@synthesize info = info_;
@synthesize music = music_;
@synthesize video = video_;
@synthesize user = user_;
@synthesize capability = capability_;

- (id)initWithData:(NSData *)data delegate:(id <ParseOperationDelegate>)theDelegate
{
    self = [super init];
    if (self != nil)
    {
        self.dataToParse = data;
        self.delegate = theDelegate;
//        self.elementsToParse = [NSArray arrayWithObjects:kIDStr, kNameStr, kImageStr, kArtistStr, nil];
        self.resultsToParse = [NSArray arrayWithObjects:KRetStr,kMsgStr,kErrCodeStr, nil];
        self.daToParse = [NSArray arrayWithObjects:kTimeStampStr,kHasNextStr, nil];
        self.infoToParse = [NSArray arrayWithObjects:kTextStr,kOrigtextStr,kCountStr,kMcount,kFromStr,kFromUrlStr,kIdStr,kImageStr,kNameStr,kOpenIdStr,kNickStr,kSelfStr,kTimeStampStr,kTypeStr,kHeadStr,kLocationStr,kCountry_codeStr,kProvince_codeStr,kCity_codeStr,kIsvipStr,kGeoStr,kStatusStr,kEmotionUrlStr,kEmotiontypeStr,nil];
        self.videoToParse = [NSArray arrayWithObjects:kPicUrlStr,kPlayerStr,kRealUrlStr,kShortUrlStr,kTitleStr, nil];
        self.musicToParse = [NSArray arrayWithObjects:kAuthorStr,kUrlStr,kTitleStr, nil];
    }
    return self;
}

// -------------------------------------------------------------------------------
//	dealloc:
// -------------------------------------------------------------------------------
- (void)dealloc
{
    [dataToParse_ release];
//    [workingEntry_ release];
    [workingPropertyString_ release];
//    [workingArray_ release];
//    [elementsToParse_ release];
    [resultObject_ release];
    [dataObject_ release];
    [infoObject_ release];
    [sourceObject_ release];
    [videoObject_ release];
    [musicObject_ release];
    [userObject_ release];
    [resultsToParse_ release];
    [daToParse_ release];
    [infoToParse_ release];
    [musicToParse_ release];
    [videoToParse_ release];

    [super dealloc];
}

// -------------------------------------------------------------------------------
//	main:
//  Given data to parse, use NSXMLParser and process all the top paid apps.
// -------------------------------------------------------------------------------
- (void)main
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
//	self.workingArray = [NSMutableArray array];
    self.workingPropertyString = [NSMutableString string];
    
    // It's also possible to have NSXMLParser download the data, by passing it a URL, but this is not
	// desirable because it gives less control over the network, particularly in responding to
	// connection errors.
    //
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:dataToParse_];
	[parser setDelegate:self];
    self.resultObject =[[[Result alloc] init] autorelease];
    [parser parse];                 //这边应该会阻塞的
	if (![self isCancelled])
    {
        // notify our AppDelegate that the parsing is complete
//        [self.delegate didFinishParsing:self.workingArray];
//        [self.delegate didFinishParsing:self.resultObject];
        BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
        switch (self.capability) {
            case MakeID(time_line, home_timeline):
                [frame broadcastBusinessListener:MakeID(time_line, other) withInparam:self.resultObject];
                break;
            case MakeID(weibo_Relation, re_list):
                [frame broadcastBusinessListener:MakeID(weibo_Relation,re_list) withInparam:self.resultObject];
                break;
            case MakeID(data_Store, list_t):{
                [frame broadcastBusinessListener:MakeID(data_Store, list_t) withInparam:self.resultObject];
            }
                break;
            case MakeID(time_line, mentions_timeline):{
                [frame broadcastBusinessListener:MakeID(time_line, mentions_timeline) withInparam:self.resultObject];
            }
                break;
            default:
                break;
        }
        
    }
    
//    self.workingArray = nil;
    self.resultObject = nil;
    self.workingPropertyString = nil;
    self.dataToParse = nil;
    
    [parser release];
    
	[pool release];
}


#pragma mark -
#pragma mark RSS processing

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
//    NSLog(@"name ::::%@++++++",elementName);
//    if ([elementName isEqualToString:kEntryStr])
//	{
//        self.workingEntry = [[[weiboRecord alloc] init] autorelease];//初始化成员
//    }//for xun lhuan
//    if([elementName isEqualToString:kResultStr])
//    {
//        self.resultObject = [[[Result alloc] init] autorelease];
//    }
    if([elementName isEqualToString:kDataStr])
    {
        self.dataObject = [[[Data alloc] init] autorelease];
        self.dataObject.infos = [NSMutableArray array];
        self.userObject = [NSMutableDictionary dictionaryWithCapacity:20];
    }
    if([elementName isEqualToString:kInfoStr])
    {
        self.infoObject = [[[Info alloc] init] autorelease];
    }
    if([elementName isEqualToString:kMusicStr])
    {
        self.musicObject = [[[Music alloc] init] autorelease];
    }
    if([elementName isEqualToString:kVideoStr])
    {
        self.videoObject = [[[Video alloc] init] autorelease];
    }
    if([elementName isEqualToString:kUserStr])
    {
        self.userObject = [NSMutableDictionary dictionary];
    }
    if([elementName isEqualToString:kSourceStr])
    {
        self.sourceObject = [[[Info alloc] init] autorelease];
    }
//    self.storingCharacterData = [self.elementsToParse containsObject:elementName];//for dan ge 
    self.result = [self.resultsToParse containsObject:elementName];
    self.data = [self.daToParse containsObject:elementName];
    self.info = [self.infoToParse containsObject:elementName];
    self.music = [self.musicToParse containsObject:elementName];
    self.video = [self.videoToParse containsObject:elementName];
//    if(![elementName isEqualToString:kUserStr])
//    {
//        self.user = YES;
//    }
//    else
//        self.user = NO;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
     NSLog(@"name ::::%@++++++",elementName);
//    if (self.workingEntry)
//	{
//        if (self.storingCharacterData)
//        {
//            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:
//                                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
//            [self.workingPropertyString setString:@""];  // clear the string for next time
//            if ([elementName isEqualToString:kIDStr])
//            {
//                self.workingEntry.appURLString = trimmedString;
//            }
//            else if ([elementName isEqualToString:kNameStr])
//            {
//                self.workingEntry.appName = trimmedString;
//            }
//            else if ([elementName isEqualToString:kImageStr])
//            {
//                self.workingEntry.imageURLString = trimmedString;
//            }
//            else if ([elementName isEqualToString:kArtistStr])
//            {
//                self.workingEntry.artist = trimmedString;
//            }
//        }
//        else if ([elementName isEqualToString:kEntryStr])
//        {
//            [self.workingArray addObject:self.workingEntry];  //初始化数组
//            self.workingEntry = nil;
//        }
//    }
    if(self.resultObject)
    {
        if(self.result)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:KRetStr])
            {
                self.resultObject.ret = trimmedString;
            }
            else if([elementName isEqualToString:kMsgStr])
            {
                self.resultObject.msg = trimmedString;
            }
            else if([elementName isEqualToString:kErrCodeStr])
            {
                self.resultObject.errCode = trimmedString;
            }
            self.result = NO;
        }
//        else if([elementName isEqualToString:kResultStr])
//        {
//            self.resultObject.data = self.dataObject;
//            self.dataObject = nil;
//        }
    }
    if(self.dataObject)
    {
        if(self.data && !self.infoObject)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:kTimeStampStr])
            {
                self.dataObject.timeStamp = trimmedString;
            }
            else if([elementName isEqualToString:kHasNextStr])
            {
                self.dataObject.hasNext = trimmedString;
            }
            self.data = NO;
        }
        else if([elementName isEqualToString:kDataStr])
        {
            self.resultObject.data = self.dataObject;
            self.dataObject = nil;
        }
    }
    if(self.infoObject)
    {
        if(self.sourceObject)
        {
            if(self.info)
            {
                NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                [self.workingPropertyString setString:@""];
                if([elementName isEqualToString:kTextStr])
                {
                    self.sourceObject.text = trimmedString;
                }
                else if([elementName isEqualToString:kOrigtextStr])
                {
                    self.sourceObject.origtext = trimmedString;
                }
                else if([elementName isEqualToString:kCountStr])
                {
                    self.sourceObject.count = trimmedString;
                }
                else if([elementName isEqualToString:kMcount])
                {
                    self.sourceObject.mcount = trimmedString;
                }
                else if([elementName isEqualToString:kFromStr])
                {
                    self.sourceObject.from = trimmedString;
                }
                else if([elementName isEqualToString:kFromUrlStr])
                {
                    self.sourceObject.fromurl = trimmedString;
                }
                else if([elementName isEqualToString:kIdStr])
                {
                    self.sourceObject.idtext =trimmedString;
                }
                else if([elementName isEqualToString:kImageStr])
                {
                    self.sourceObject.image = trimmedString;
                }
                else if([elementName isEqualToString:kNameStr])
                {
                    self.sourceObject.name = trimmedString;
                }
                else if([elementName isEqualToString:kOpenIdStr])
                {
                    self.sourceObject.openId = trimmedString;
                }
                else if([elementName isEqualToString:kNickStr])
                {
                    self.sourceObject.nick = trimmedString;
                }
                else if([elementName isEqualToString:kSelfStr])
                {
                    self.sourceObject.selftext = trimmedString;
                }
                else if([elementName isEqualToString:kTimeStampStr])
                {
                    self.infoObject.time = trimmedString;
                }
                else if([elementName isEqualToString:kTypeStr])
                {
                    self.sourceObject.type = trimmedString;
                }
                else if([elementName isEqualToString:kHeadStr])
                {
                    self.sourceObject.head = trimmedString;
                }
                else if([elementName isEqualToString:kLocationStr])
                {
                    self.sourceObject.location = trimmedString;
                }
                else if([elementName isEqualToString:kCountry_codeStr])
                {
                    self.sourceObject.country_code = trimmedString;
                }
                else if([elementName isEqualToString:kProvince_codeStr])
                {
                    self.sourceObject.province_code = trimmedString;
                }
                else if([elementName isEqualToString:kCity_codeStr])
                {
                    self.sourceObject.city_code = trimmedString;
                }
                else if([elementName isEqualToString:kIsvipStr])
                {
                    self.sourceObject.isvip = trimmedString;
                }
                else if([elementName isEqualToString:kGeoStr])
                {
                    self.sourceObject.geo = trimmedString;
                }
                else if([elementName isEqualToString:kStatusStr])
                {
                    self.sourceObject.status = trimmedString;
                }
                else if([elementName isEqualToString:kEmotionUrlStr])
                {
                    self.sourceObject.emotion = trimmedString;
                }
                else if([elementName isEqualToString:kEmotiontypeStr])
                {
                    self.sourceObject.emotiontype = trimmedString;
                }
                self.info = NO;
            }
            else if([elementName isEqualToString:kSourceStr])
            {
                self.infoObject.source = self.sourceObject;
                self.sourceObject = nil;
            }
        }
        else if(self.info)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:kTextStr])
            {
                self.infoObject.text = trimmedString;
            }
            else if([elementName isEqualToString:kOrigtextStr])
            {
                self.infoObject.origtext = trimmedString;
            }
            else if([elementName isEqualToString:kCountStr])
            {
                self.infoObject.count = trimmedString;
            }
            else if([elementName isEqualToString:kMcount])
            {
                self.infoObject.mcount = trimmedString;
            }
            else if([elementName isEqualToString:kFromStr])
            {
                self.infoObject.from = trimmedString;
            }
            else if([elementName isEqualToString:kFromUrlStr])
            {
                self.infoObject.fromurl = trimmedString;
            }
            else if([elementName isEqualToString:kIdStr])
            {
                self.infoObject.idtext =trimmedString;
            }
            else if([elementName isEqualToString:kImageStr])
            {
                self.infoObject.image = trimmedString;
            }
            else if([elementName isEqualToString:kNameStr])
            {
                self.infoObject.name = trimmedString;
            }
            else if([elementName isEqualToString:kOpenIdStr])
            {
                self.infoObject.openId = trimmedString;
            }
            else if([elementName isEqualToString:kNickStr])
            {
                self.infoObject.nick = trimmedString;
            }
            else if([elementName isEqualToString:kSelfStr])
            {
                self.infoObject.selftext = trimmedString;
            }
            else if([elementName isEqualToString:kTypeStr])
            {
                self.infoObject.type = trimmedString;
            }
            else if([elementName isEqualToString:kTimeStampStr])
            {
                self.infoObject.time = trimmedString;
            }
            else if([elementName isEqualToString:kHeadStr])
            {
                self.infoObject.head = trimmedString;
            }
            else if([elementName isEqualToString:kLocationStr])
            {
                self.infoObject.location = trimmedString;
            }
            else if([elementName isEqualToString:kCountry_codeStr])
            {
                self.infoObject.country_code = trimmedString;
            }
            else if([elementName isEqualToString:kProvince_codeStr])
            {
                self.infoObject.province_code = trimmedString;
            }
            else if([elementName isEqualToString:kCity_codeStr])
            {
                self.infoObject.city_code = trimmedString;
            }
            else if([elementName isEqualToString:kIsvipStr])
            {
                self.infoObject.isvip = trimmedString;
            }
            else if([elementName isEqualToString:kGeoStr])
            {
                self.infoObject.geo = trimmedString;
            }
            else if([elementName isEqualToString:kStatusStr])
            {
                self.infoObject.status = trimmedString;
            }
            else if([elementName isEqualToString:kEmotionUrlStr])
            {
                self.infoObject.emotion = trimmedString;
            }
            else if([elementName isEqualToString:kEmotiontypeStr])
            {
                self.infoObject.emotiontype = trimmedString;
            }
            self.info = NO;
        }
        else if([elementName isEqualToString:kInfoStr])
        {
            [self.dataObject.infos addObject:self.infoObject];
            self.infoObject = nil;
        }
    }
    if(self.musicObject)
    {
        if(self.music)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:kAuthorStr])
            {
                self.musicObject.author = trimmedString;
            }
            else if([elementName isEqualToString:kUrlStr])
            {
                self.musicObject.url = trimmedString;
            }
            else if([elementName isEqualToString:kTitleStr])
            {
                self.musicObject.title = trimmedString;
            }
            self.music = NO;
        }
        else if([elementName isEqualToString:kMusicStr])
        {
            if(self.sourceObject)
            {
                self.sourceObject.music = self.musicObject;
                self.musicObject = nil;
            }
            else
            {
                self.infoObject.music = self.musicObject;
                self.musicObject = nil;
            }
        }
    }
    if(self.videoObject)
    {
        if(self.video)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:kPicUrlStr])
            {
                self.videoObject.picurl = trimmedString;
            }
            else if([elementName isEqualToString:kPlayerStr])
            {
                self.videoObject.player = trimmedString;
            }
            else if([elementName isEqualToString:kRealUrlStr])
            {
                self.videoObject.realurl = trimmedString;
            }
            else if([elementName isEqualToString:kShortUrlStr])
            {
                self.videoObject.shorturl = trimmedString;
            }
            else if([elementName isEqualToString:kTitleStr])
            {
                self.videoObject.title = trimmedString;
            }
            self.video = NO;
        }
        else if([elementName isEqualToString:kVideoStr])
        {
            if(self.sourceObject)
            {
                self.sourceObject.video = self.videoObject;
                self.videoObject = nil;
            }
            else
            {
                self.infoObject.video = self.videoObject;
                self.videoObject = nil;
            }
        }
    }
    if(self.userObject)
    {
        //tianjia dao zi dian zhong 
        if(![elementName isEqualToString:kUserStr])
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
//            [self.dataObject.user setValue:trimmedString forKey:elementName];
            [self.userObject setObject:trimmedString forKey:elementName];
        }
        else if([elementName isEqualToString:kUserStr])
        {
            self.dataObject.user = self.userObject;
//            self.userObject = nil;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
//    if (self.storingCharacterData)
//    {
//        [self.workingPropertyString appendString:string];
//    }
    if(self.result || self.data || self.info || self.music || self.video || self.user)
    {
        [self.workingPropertyString appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    [self.delegate parseErrorOccurred:parseError];
}

@end
