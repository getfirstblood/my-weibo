//
//  MentionDetailsViewController.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-21.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "MentionDetailsViewController.h"
#import "HomePage.h"
#import "BroadcastMessageCell.h"
#import "BroadCastMessageCellNew.h"
#import "CommentCell.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
#import "Info.h"
#import "comment.h"
@implementation MentionDetailsViewController

@synthesize headBtn = headBtn_;
@synthesize nameLabel = nameLabel_;
@synthesize transmitBtn = transmitBtn_;
@synthesize commentBtn = commentBtn_;
@synthesize moreBtn = moreBtn_;
@synthesize mentionView = mentionView_;
@synthesize mention = mention_;
@synthesize ret = ret_;
@synthesize active = active_;
- (IBAction)headBtnClicked
{
    NSLog(@"headBtnClicked..........");
}

- (IBAction)transmitBtnClicked
{
    NSLog(@"transmitBtnClicked...........");
    comment *comm = [[[comment alloc] init] autorelease];
    comm.tag = @"zhuan";
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
    comm.weiboid = tmp.idtext;
    [self.navigationController pushViewController:comm animated:YES];
}

- (IBAction)commentBtnClicked
{
    NSLog(@"commentBtnClicked...........");
    comment *comm = [[[comment alloc] init] autorelease];
    comm.tag = @"ping";
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
    comm.weiboid = tmp.idtext;
    [self.navigationController pushViewController:comm animated:YES];
}

- (IBAction)moreBtnClicked
{
    NSLog(@"moreBtnClicked..........");
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:tmp.idtext,@"addtid", nil];
    [frame callBusinessProcess:MakeID(data_Store, addt) withInParam:dic andOutParam:nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" 
                                                    message:@"sucess"
                                                   delegate:nil
                                          cancelButtonTitle:@"ok!" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}
- (void)head
{
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
    if(tmp.headImage != nil)
        [self.headBtn setImage:tmp.headImage forState:UIControlStateNormal];
}
- (void)set:(HomePage *)mention
{
    self.mention = mention;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame unregisterBusinessListener:self];
    [headBtn_ release];
    [nameLabel_ release];
    [transmitBtn_ release];
    [commentBtn_ release];
    [moreBtn_ release];
    [mentionView_ release];
    [mention_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.mention.menView = self;
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
    self.nameLabel.text = tmp.nick;
    if(tmp.headImage == nil)
        [self performSelector:@selector(head) withObject:nil afterDelay:5];
    [self.headBtn setImage:tmp.headImage forState:UIControlStateNormal];
    
    [self.mentionView setBackgroundColor:[UIColor clearColor]];
    NSString *str = nil;
    if(tmp.source.origtext == nil || [tmp.source.origtext isEqualToString:@""])
        str = tmp.idtext;
    else
        str = tmp.source.idtext;
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame registerBusinessListener:self];
    [frame callBusinessProcess:MakeID(weibo_Relation, re_list) withInParam:str andOutParam:nil];
    
    Info *infoTmp = [self.ret.data.infos objectAtIndex:0];
    NSLog(@"%@",infoTmp.name);
    [self.active startAnimating];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.headBtn = nil;
    self.nameLabel = nil;
    self.transmitBtn = nil;
    self.commentBtn = nil;
    self.moreBtn = nil;
    self.mentionView = nil;
    //self.mention = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Table View DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    else
    {
        if(self.ret == nil)
            return 0;
        else
            return [self.ret.data.infos count];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    static NSString *broadcastCellIdentifier = @"broadcastCellIdentifier";
    static NSString *commentCell = @"commentCell";
    BroadcastMessageCell *cell = (BroadcastMessageCell *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    BroadCastMessageCellNew *cellNew = (BroadCastMessageCellNew *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    CommentCell *cellTwo = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:commentCell];
    
    NSInteger num = self.mention.index;
    Info *tmp = [self.mention.ret.data.infos objectAtIndex:num];
     NSArray *nib = nil;
    
    if (section == 0)
    {
        if ([tmp.source.origtext isEqualToString:@""])
        {
            if (nil == cellNew)
            {
                nib = [[NSBundle mainBundle] loadNibNamed:@"BroadCastMessageCellNew" owner:self options:nil];
                for (id oneobj in nib)
                {
                    cellNew = (BroadCastMessageCellNew *)oneobj;
                }
            }
            Info *infoTmp = [self.mention.ret.data.infos objectAtIndex:self.mention.index];
            CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
            cellNew.mySpeech.frame = CGRectMake(10, 10, 280, sizeMy.height);
            cellNew.mySpeech.text = infoTmp.text;
            
            return cellNew;
        }
        else
        {
            if (nil == cell)
            {
                nib = [[NSBundle mainBundle] loadNibNamed:@"BroadCastMessageCell" owner:self options:nil];
                for (id oneobj in nib)
                {
                    cell = (BroadcastMessageCell *)oneobj;
                }
            }
            Info *infoTmp = [self.mention.ret.data.infos objectAtIndex:self.mention.index];
            CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
            CGSize sizeOther = [infoTmp.source.origtext sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
            cell.mySpeech.frame = CGRectMake(10, 10, 280, sizeMy.height);
            cell.mySpeech.text = infoTmp.text;
            cell.othersSppech.frame = CGRectMake(10, sizeMy.height+10, 280, sizeOther.height);
            cell.othersSppech.text = infoTmp.source.origtext;
            return cell;
            
        }
    }
    
    else
    {
        if (nil == cellTwo)
        {
            nib = [[NSBundle mainBundle] loadNibNamed:@"commentCell" owner:self options:nil];
            for (id oneobj in nib)
            {
                cellTwo = (CommentCell *)oneobj;
            }
        }
        Info *in = [self.ret.data.infos objectAtIndex:row];
        CGSize sizeComment = [in.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
        cellTwo.commentUserNameLabel.frame = CGRectMake(10, 10, 80, 20);
        cellTwo.commentUserNameLabel.text = in.nick;
        cellTwo.commentContentLabel.frame = CGRectMake(30, 30, 280, sizeComment.height);
        cellTwo.commentContentLabel.text = in.text;
        cellTwo.commentTimeLabel.frame = CGRectMake(200, 10, 80, 20);
        cellTwo.commentTimeLabel.text = in.time;
        return cellTwo;
        
    }
}

#pragma mark Table View Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    Info *infoTmp = [self.mention.ret.data.infos objectAtIndex:self.mention.index];
    CGSize sizeComment;
    if([self.ret.data.infos count]>0)
    {
        Info *in = [self.ret.data.infos objectAtIndex:row];
        sizeComment = [in.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    }
    CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    CGSize sizeOther = [infoTmp.source.origtext sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    if (section == 0)
    {
        if ([infoTmp.source.origtext isEqualToString:@""])
            return (sizeMy.height + 40);
        else
            return (sizeMy.height + sizeOther.height + 40);
    }
    else
        return sizeComment.height + 50;
}
- (void)processBusinessNotify:(int)notifcationId withInParam:(id)inParam
{
    switch (notifcationId) {
        case MakeID(weibo_Relation, re_list):
        {
            self.ret = (Result *)inParam;
            NSLog(@"sucess");
            [self.mentionView reloadData];
            [self.active removeFromSuperview];
        }
            break;
            
        default:
            break;
    }
}
@end
