//
//  CollectViewController.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-24.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "CollectViewController.h"
#import "CellInformation.h"
#import "BroadcastMessageCell.h"
#import "BroadCastMessageCellNew.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
#import "CollectDetailViewController.h"
@interface CollectViewController ()

- (void)startIconDownload:(Info *)appRecord forIndexPath:(NSIndexPath *)indexPath;
- (void)loadImagesForOnscreenRows;
@end
@implementation CollectViewController

@synthesize collectView = collectView_;
@synthesize cellInfoArr = cellInfoArr_;
@synthesize ret = ret_;
@synthesize index = index_;
@synthesize activity = activity_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame unregisterBusinessListener:self];
    [collectView_ release];
    [cellInfoArr_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame registerBusinessListener:self];
    [frame callBusinessProcess:MakeID(data_Store, list_t) withInParam:nil andOutParam:nil];
    self.collectView.hidden = YES;
    [self.activity startAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.collectView = nil;
    self.cellInfoArr = nil;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table Data Source Methos

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.ret == nil)
        return 0;
    else
        return [self.ret.data.infos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    static NSString *broadcastCellIdentifier = @"broadcastCellIdentifier";
    BroadcastMessageCell *cell = (BroadcastMessageCell *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    BroadCastMessageCellNew *cellNew = (BroadCastMessageCellNew *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    
    Info *info = [self.ret.data.infos objectAtIndex: row];
    
    NSLog(@"%@",info.text);

    NSArray *nib = nil;
    
    if ([info.source.origtext isEqualToString:@""])
    {
        if (nil == cellNew)
        {
            nib = [[NSBundle mainBundle] loadNibNamed:@"BroadCastMessageCellNew" owner:self options:nil];
            for (id oneobj in nib)
            {
                cellNew = (BroadCastMessageCellNew *)oneobj;
            }
        }
        Info *infoTmp = [self.ret.data.infos objectAtIndex:row];
        CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
        // NSLog(@"%f",sizeMy.height);
        UIImage *head = [UIImage imageNamed: @"001.png"];
        
        cellNew.userHeadImage.frame = CGRectMake(5, 5, 50, 50);
        cellNew.userHeadImage.image = head;
        cellNew.userName.frame = CGRectMake(70, 15, 100, 30);
        cellNew.userName.text = info.nick;
        cellNew.releaseMessageTime.frame = CGRectMake(220, 15, 100, 30);
        cellNew.releaseMessageTime.text = info.time;
        cellNew.mySpeech.numberOfLines = 0;
        cellNew.mySpeech.frame = CGRectMake(30, 45, 280,sizeMy.height);
        cellNew.mySpeech.font = [UIFont systemFontOfSize:16.0];
        cellNew.mySpeech.text = info.text;
        cellNew.from.frame = CGRectMake(20, sizeMy.height + 35, 50, 20);
        cellNew.from.text = @"来自";
        cellNew.whereFrom.frame = CGRectMake(70, sizeMy.height + 35, 120, 20);
        cellNew.whereFrom.text = info.from;
        cellNew.manyTransmit.frame = CGRectMake(220, sizeMy.height + 35, 50, 20);
        cellNew.manyTransmit.text = info.count;
        cellNew.manyComment.frame = CGRectMake(270, sizeMy.height + 35, 50, 20);
        cellNew.manyComment.text = info.mcount;
        
        if (!info.headImage)
        {
            if (self.collectView.dragging == NO && self.collectView.decelerating == NO)
            {
                //                [self startIconDownload:info forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.userHeadImage.image = [UIImage imageNamed:@"001.png"];                
        }
        else
        {
            cell.userHeadImage.image = info.headImage;
        }
        
        return cellNew;
        
    }
    else
    {
        if (nil == cell)
        {
            nib = [[NSBundle mainBundle] loadNibNamed:@"BroadcastMessageCell" owner:self options:nil];
            for (id oneobj in nib)
            {
                cell = (BroadcastMessageCell *)oneobj;
            }
        }
        Info *infoTmp = [self.ret.data.infos objectAtIndex:row];
        CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
        CGSize sizeOther = [infoTmp.source.origtext sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
        NSLog(@"%f",sizeMy.height);
        NSLog(@"%f",sizeOther.height);
        
        UIImage *head = [UIImage imageNamed: @"002.png"];
        
        cell.userHeadImage.frame = CGRectMake(5, 5, 50, 50);
        cell.userHeadImage.image = head;
        cell.userName.frame = CGRectMake(70, 15, 100, 30);
        cell.userName.text = infoTmp.nick;
        cell.releaseMessageTime.frame = CGRectMake(220, 15, 100, 30);
        cell.releaseMessageTime.text = infoTmp.time;
        cell.mySpeech.numberOfLines = 0;
        cell.mySpeech.frame = CGRectMake(30, 55, 280,sizeMy.height);
        cell.mySpeech.font = [UIFont systemFontOfSize:16.0];
        cell.mySpeech.text = infoTmp.text;
        cell.othersSppech.numberOfLines = 0;
        cell.othersSppech.frame = CGRectMake(30, sizeMy.height + 55, 280, sizeOther.height);
        cell.othersSppech.font = [UIFont systemFontOfSize:16.0];
        cell.othersSppech.text = infoTmp.source.origtext;
        cell.from.frame = CGRectMake(20, sizeMy.height +sizeOther.height + 55, 50, 20);
        cell.from.text = @"来自";
        cell.whereFrom.frame = CGRectMake(70, sizeMy.height +sizeOther.height + 55, 120, 20);
        cell.whereFrom.text = infoTmp.from;
        cell.manyTransmit.frame = CGRectMake(220, sizeMy.height +sizeOther.height + 55, 50, 20);
        cell.manyTransmit.text = infoTmp.count;
        cell.manyComment.frame = CGRectMake(270, sizeMy.height +sizeOther.height + 55, 50, 20);
        cell.manyComment.text = infoTmp.mcount;
        
        if (!info.headImage)
        {
            if (self.collectView.dragging == NO && self.collectView.decelerating == NO)
            {
                //                [self startIconDownload:info forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.userHeadImage.image = [UIImage imageNamed:@"001.png"];                
        }
        else
        {
            cell.userHeadImage.image = info.headImage;
        }
        
        return cell;
    }
}

#pragma mark Table Delegate Methos

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    self.index = row;
    CollectDetailViewController *collectDetailView = [[CollectDetailViewController alloc] init];
    collectDetailView.collect = self;
    [self.navigationController pushViewController:collectDetailView animated:YES];
    collectDetailView.title = @"Detail Infomation";
    [collectDetailView release];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    Info *infoTmp = [self.ret.data.infos objectAtIndex:row];
    CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    CGSize sizeOther = [infoTmp.source.origtext sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    
    
    if ([infoTmp.source.origtext isEqualToString:@""])
        return (sizeMy.height + 60);
    else
        return (sizeMy.height + sizeOther.height + 80);

}
- (void)processBusinessNotify:(int)notifcationId withInParam:(id)inParam
{
    switch (notifcationId) {
        case MakeID(data_Store, list_t):
        {
            self.ret = (Result *)inParam;
            NSLog(@"sucess");
            [self.collectView reloadData];
            self.collectView.hidden = NO;
            [self.activity removeFromSuperview];

        }
            break;
        case MakeID(time_line, headdownload2):
        {
            NSIndexPath *path = (NSIndexPath *)inParam;
            UIImage *image = [[self.ret.data.infos objectAtIndex:path.row] headImage];
            UITableViewCell *cell = [self.collectView cellForRowAtIndexPath:path];
            if([[[[self.ret.data.infos objectAtIndex:path.row] source] text] isEqualToString:@""])
            {
                BroadcastMessageCell *cel = (BroadcastMessageCell *)cell;
                cel.userHeadImage.image = image;
            }
            else
            {
                BroadCastMessageCellNew *celnew = (BroadCastMessageCellNew *)cell;
                celnew.userHeadImage.image = image;
            }
            
        }
            break;
        default:
            break;
    }
}

- (void)startIconDownload:(Info *)appRecord forIndexPath:(NSIndexPath *)indexPath
{
    if(appRecord.headImage == nil)
    {
        BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:appRecord,@"record",indexPath,@"path", @"collect",@"class",nil];
        [frame callBusinessProcess:MakeID(time_line, headdownload) withInParam:dic andOutParam:nil];
    }
}

- (void)loadImagesForOnscreenRows
{
    if ([self.ret.data.infos count] > 0)
    {
        NSArray *visiblePaths = [self.collectView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            Info *info = [self.ret.data.infos objectAtIndex:indexPath.row];
            
            if (!info.headImage) // avoid the app icon download if the app already has an icon
            {
                [self startIconDownload:info forIndexPath:indexPath];
            }
        }
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
//- (void)appImageDidLoad:(NSIndexPath *)indexPath
//{
//    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
//    if (iconDownloader != nil)
//    {
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
//        
//        // Display the newly loaded image
//        cell.imageView.image = iconDownloader.appRecord.appIcon;
//    }
//}


#pragma mark -
#pragma mark Deferred image loading (UIScrollViewDelegate)

// Load images for all onscreen rows when scrolling is finished
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
	{
        [self loadImagesForOnscreenRows];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self loadImagesForOnscreenRows];
}


@end
