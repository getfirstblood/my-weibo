//
//  InfoParse.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-18.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "InfoParse.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
//static NSString                *resultstr = @"";
static NSString                *suretstr = @"ret";
static NSString                *sumsgstr = @"msg";
static NSString                *suerrCodestr = @"errcode";

static NSString                *datastr = @"data";
static NSString                *danamestr = @"name";
static NSString                *daopenidstr = @"openid";
static NSString                *danickstr = @"nick";
static NSString                *daheadstr = @"head";
static NSString                *daisrealnamestr = @"isrealname";
static NSString                *dalocationstr = @"location";
static NSString                *daisvipstr = @"isvip";
static NSString                *daisentstr = @"isent";
static NSString                *daintroductionstr = @"introduction";
static NSString                *daverifyinfostr = @"verifyinfo";
static NSString                *daemailstr = @"email";
static NSString                *dabirth_yearstr = @"birth_year";
static NSString                *dabirth_monthstr = @"birth_month";
static NSString                *dabirth_daystr = @"birth_day";
static NSString                *dacountry_codestr = @"country_code";
static NSString                *daprovince_codestr = @"province_code";
static NSString                *dacity_codestr = @"city_code";
static NSString                *dasexstr = @"sex";
static NSString                *dafansnumstr = @"fansnum";
static NSString                *daidolnumstr = @"idolnum";
static NSString                *datweetnumstr = @"tweetnum";

static NSString                *tagstr = @"tag";
static NSString                *tainfoidstr = @"id";
static NSString                *tanamestr = @"name";

static NSString                *edustr = @"edu";
static NSString                *edinfoidstr = @"id";
static NSString                *edyearstr = @"year";
static NSString                *edschoolidstr = @"schoolid";
static NSString                *eddepartmentidstr = @"departmentid";
static NSString                *edlevelstr = @"level";


@implementation InfoParse
@synthesize dataToParse = dataToParse_;
@synthesize workingPropertyString = workingPropertyString_;
@synthesize ioResult = ioResult_;
@synthesize ioData = ioData_;
@synthesize ioTag = ioTag_;
@synthesize ioEdu = ioEdu_;
@synthesize ioResultToParse = ioResultToParse_;
@synthesize ioDataToParse = ioDataToParse_;
@synthesize ioTagToParse = ioTagToParse_;
@synthesize ioEduToParse = ioEduToParse_;
@synthesize storingCharacterData = storingCharacterData_;
@synthesize result = result_;
@synthesize data = data_;
@synthesize tag =tag_;
@synthesize edu = edu_;
- (id)initWithData:(NSData *)data
{
    self = [super init];
    if(self != nil)
    {
        self.dataToParse = data;
        self.ioDataToParse = [NSArray arrayWithObjects:danamestr,daopenidstr,danickstr,daheadstr,daisrealnamestr,dalocationstr,dacountry_codestr,daprovince_codestr,dacity_codestr,daisvipstr,daisentstr,daintroductionstr,daverifyinfostr,daemailstr,dabirth_daystr,dabirth_monthstr,dabirth_yearstr,dasexstr,dafansnumstr,daidolnumstr,datweetnumstr, nil];
        self.ioResultToParse = [NSArray arrayWithObjects:suretstr,sumsgstr,suerrCodestr, nil];
        self.ioTagToParse = [NSArray arrayWithObjects:tainfoidstr,tanamestr, nil];
        self.ioEduToParse = [NSArray arrayWithObjects:edinfoidstr,edyearstr,edschoolidstr,eddepartmentidstr,edlevelstr, nil];
    }
    return self;
}
- (void)dealloc
{
    [dataToParse_ release];
    [workingPropertyString_ release];
    [ioResult_ release];
    [ioData_ release];
    [ioTag_ release];
    [ioEdu_ release];
    [ioResultToParse_ release];
    [ioDataToParse_ release];
    [ioTagToParse_ release];
    [ioEduToParse_ release];
    [super dealloc];
}
- (void)main
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    self.workingPropertyString = [NSMutableString string];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.dataToParse];
    self.ioResult = [[[infoResult alloc] init] autorelease];
    [parser setDelegate:self];
    [parser parse];
    if(![self isCancelled])
    {
        NSLog(@"f");
        BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
        [frame broadcastBusinessListener:MakeID(account_Relation, info) withInparam:self.ioResult];
    }
    self.ioResult = nil;
    self.workingPropertyString = nil;
    self.dataToParse = nil;
    [parser release];
    [pool release];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:datastr])
    {
        self.ioData = [[[infoData alloc] init] autorelease];
        self.ioData.tag = [NSMutableArray array];
        self.ioData.edu = [NSMutableArray array];
    }
    if([elementName isEqualToString:tagstr])
    {
        self.ioTag = [[[infoTag alloc] init] autorelease];
    }
    if([elementName isEqualToString:edustr])
    {
        self.ioEdu = [[[infoEdu alloc] init] autorelease];
    }
    self.result = self.data = self.tag = self.edu = NO;
    self.result = [self.ioResultToParse containsObject:elementName];
    self.data = [self.ioDataToParse containsObject:elementName];
    if(self.ioTag)
        self.tag = [self.ioTagToParse containsObject:elementName];
    if(self.ioEdu)
        self.edu = [self.ioEduToParse containsObject:elementName];
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"+++++++%@",elementName);
    if(self.ioResult)
    {
        if(self.result)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:suretstr])
            {
                self.ioResult.ret = trimmedString;
            }
            else if([elementName isEqualToString:sumsgstr])
            {
                self.ioResult.msg = trimmedString;
            }
            else if([elementName isEqualToString:suerrCodestr])
            {
                self.ioResult.errCode = trimmedString;
            }
            self.result = NO;
        }
    }
    if(self.ioData)
    {
        if(self.ioTag)
        {
            if(self.tag)
            {
                NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                [self.workingPropertyString setString:@""];
                if([elementName isEqualToString:tainfoidstr])
                {
                    self.ioTag.infoid = trimmedString;
                }
                else if([elementName isEqualToString:tanamestr])
                {
                    self.ioTag.name = trimmedString;
                }
                self.tag = NO;
            }
            else if([elementName isEqualToString:tagstr])
            {
                [self.ioData.tag addObject:self.ioTag];
                self.ioTag = nil;
            }
        }
        else if(self.ioEdu)
        {
            if(self.edu)
            {
                NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                [self.workingPropertyString setString:@""];
                if([elementName isEqualToString:edinfoidstr])
                {
                    self.ioEdu.infoid = trimmedString;
                }
                else if([elementName isEqualToString:edyearstr])
                {
                    self.ioEdu.year = trimmedString;
                }
                else if([elementName isEqualToString:edschoolidstr])
                {
                    self.ioEdu.schoolid = trimmedString;
                }
                else if([elementName isEqualToString:eddepartmentidstr])
                {
                    self.ioEdu.departmentid = trimmedString;
                }
                else if([elementName isEqualToString:edlevelstr])
                {
                    self.ioEdu.level = trimmedString;
                }
                self.edu = NO;
            }
            else if([elementName isEqualToString:edustr])
            {
                [self.ioData.edu addObject:self.ioEdu];
                self.ioEdu = nil;
            }
        }
        else if(self.data)
        {
            NSString *trimmedString = [self.workingPropertyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [self.workingPropertyString setString:@""];
            if([elementName isEqualToString:danamestr])
            {
                self.ioData.name = trimmedString;
                NSLog(@"%@",trimmedString);
            }
            else if([elementName isEqualToString:daopenidstr])
            {
                self.ioData.openid = trimmedString;
            }
            else if([elementName isEqualToString:danickstr])
            {
                self.ioData.nick = trimmedString;
            }
            else if([elementName isEqualToString:daheadstr])
            {
                self.ioData.head = trimmedString;
            }
            else if([elementName isEqualToString:daisrealnamestr])
            {
                self.ioData.isrealname = trimmedString;
            }
            else if([elementName isEqualToString:dalocationstr])
            {
                self.ioData.location = trimmedString;
            }
            else if([elementName isEqualToString:daisvipstr])
            {
                self.ioData.isvip = trimmedString;
            }
            else if([elementName isEqualToString:daisentstr])
            {
                self.ioData.isent = trimmedString;
            }
            else if([elementName isEqualToString:daintroductionstr])
            {
                self.ioData.introduction = trimmedString;
            }
            else if([elementName isEqualToString:daverifyinfostr])
            {
                self.ioData.verifyinfo = trimmedString;
            }
            else if([elementName isEqualToString:daemailstr])
            {
                self.ioData.email = trimmedString;
            }
            else if([elementName isEqualToString:dabirth_daystr])
            {
                self.ioData.birth_day = trimmedString;
            }
            else if([elementName isEqualToString:dabirth_monthstr])
            {
                self.ioData.birth_month = trimmedString;
            }
            else if([elementName isEqualToString:dabirth_yearstr])
            {
                self.ioData.birth_year = trimmedString;
            }
            else if([elementName isEqualToString:dacountry_codestr])
            {
                self.ioData.country_code = trimmedString;
            }
            else if([elementName isEqualToString:daprovince_codestr])
            {
                self.ioData.province_code = trimmedString;
            }
            else if([elementName isEqualToString:dacity_codestr])
            {
                self.ioData.city_code = trimmedString;
            }
            else if([elementName isEqualToString:dasexstr])
            {
                self.ioData.sex = trimmedString;
            }
            else if([elementName isEqualToString:dafansnumstr])
            {
                self.ioData.fansnum = trimmedString;
            }
            else if([elementName isEqualToString:daidolnumstr])
            {
                self.ioData.idolnum = trimmedString;
            }
            else if([elementName isEqualToString:datweetnumstr])
            {
                self.ioData.tweetnum = trimmedString;
            }
            self.data = NO;
        }
        else if([elementName isEqualToString:datastr])
        {
            self.ioResult.data = self.ioData;
            self.ioData = nil;
        }
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(self.result || self.data || self.tag || self.edu)
    {
        [self.workingPropertyString appendString:string];
    }
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"error");
}
@end
