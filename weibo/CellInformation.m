//
//  CellInformation.m
//  tabbar
//
//  Created by ji jiandong on 4/5/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "CellInformation.h"


@implementation CellInformation

@synthesize headImage     = headImage_;
@synthesize userName      = userName_;
@synthesize broadcastTime = broadcastTime_;
@synthesize mySpeech      = mySpeech_;
@synthesize othersSpeech  = othersSpeech_;
@synthesize from          = from_;
@synthesize tramitCount   = tramitCount_;
@synthesize commentCount  = commentCount_;

- (void)dealloc
{
    [super dealloc];
    
    [headImage_ release];
    [userName_ release];
    [broadcastTime_ release];
    [mySpeech_ release];
    [othersSpeech_ release];
    [from_ release];
    [tramitCount_ release];
    [commentCount_ release];
}

@end
