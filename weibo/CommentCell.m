//
//  CommentCell.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-23.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "CommentCell.h"


@implementation CommentCell

@synthesize commentUserNameLabel = commentUserNameLabel_;
@synthesize commentContentLabel = commentContentLabel_;
@synthesize commentTimeLabel = commentTimeLabel_;

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
    [commentUserNameLabel_ release];
    [commentContentLabel_ release];
    [commentTimeLabel_ release];
    [super dealloc];
}
@end
