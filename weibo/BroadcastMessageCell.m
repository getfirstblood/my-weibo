//
//  BroadcastMessageCell.m
//  tabbar
//
//  Created by ji jiandong on 3/29/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "BroadcastMessageCell.h"


@implementation BroadcastMessageCell

@synthesize userHeadImage = userHeadImage_;
@synthesize userName = userName_;
@synthesize releaseMessageTime = releaseMessageTime_;
@synthesize mySpeech = mySpeech_;
@synthesize othersSppech = othersSpeech_;
@synthesize from = from_;
@synthesize whereFrom = whereFrom_;
@synthesize manyTransmit = manyTransmit_;
@synthesize manyComment = manyComment_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc
{
    [super dealloc];
    [userHeadImage_ release];
    [userName_ release];
    [releaseMessageTime_ release];
    [mySpeech_ release];
    [othersSpeech_ release];
    [from_ release];
    [whereFrom_ release];
    [manyTransmit_ release];
    [manyComment_ release];
}



@end
