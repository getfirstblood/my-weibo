//
//  Mention.m
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "Mention.h"
#import "OriginalReportCell.h"
#import "HomePageDetailViewController.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
#import "WriteController.h"
#import "BroadcastMessageCell.h"
#import "BroadCastMessageCellNew.h"
@interface Mention ()

- (void)startIconDownload:(Info *)appRecord forIndexPath:(NSIndexPath *)indexPath;
- (void)loadImagesForOnscreenRows;
@end
@implementation Mention
@synthesize weiboRecords=weiboRecords_;
@synthesize recordTable=recordTable_;
@synthesize result = result_;
@synthesize updateButton = updateButton_;
@synthesize activity = activity_;
@synthesize index = index_;
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
    [weiboRecords_ release];
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame unregisterBusinessListener:self];
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
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    [frame registerBusinessListener:self];
    [frame callBusinessProcess:MakeID(time_line, home_timeline) withInParam:nil andOutParam:nil];
    // Do any additional setup after loading the view from its nib.
//    MentionDownLoad *down=[[[MentionDownLoad alloc] init] autorelease];
//    self.downLoad=down;
//    down.mention=self;
//    [self.downLoad startDownLoad];
    self.recordTable.rowHeight=60;
    self.weiboRecords = [NSMutableArray array];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.updateButton = btn;
    btn.frame = CGRectMake(15, 5, 38, 38);
    [btn setTitle:@"刷新" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = back;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(305, 5, 38, 38);
    [btn setTitle:@"写写" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(write:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightbutton;
    [self.activity startAnimating];
    self.recordTable.hidden = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark tableview life method
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.result == nil)
        return 0;
    else
        return [self.result.data.infos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    static NSString *broadcastCellIdentifier = @"broadcastCellIdentifier";
    BroadcastMessageCell *cell = (BroadcastMessageCell *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    BroadCastMessageCellNew *cellNew = (BroadCastMessageCellNew *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    //CellInformation *info = [self.cellInfoArr objectAtIndex:row];;
    
    Info *info = [self.result.data.infos objectAtIndex:row];
    NSLog(@"%@",info.text);
    NSLog(@"%@",info.source.origtext);
    
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
        Info *infoTmp = [self.result.data.infos objectAtIndex:row];
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
            if (self.recordTable.dragging == NO && self.recordTable.decelerating == NO)
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
        Info *infoTmp = [self.result.data.infos objectAtIndex:row];
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
            if (self.recordTable.dragging == NO && self.recordTable.decelerating == NO)
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    self.index = row;
    HomePageDetailViewController *homeView = [[HomePageDetailViewController alloc] init];
    homeView.home = self;
    [self.navigationController pushViewController:homeView animated:YES];
    homeView.title = @"Detail Infomation";
    [homeView release];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    Info *infoTmp = [self.result.data.infos objectAtIndex:row];
    CGSize sizeMy = [infoTmp.text sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    CGSize sizeOther = [infoTmp.source.origtext sizeWithFont:[UIFont systemFontOfSize:16.0]constrainedToSize:CGSizeMake(200.0, 200.0) lineBreakMode:UILineBreakModeWordWrap];
    
    
    if ([infoTmp.source.origtext isEqualToString:@""])
        return (sizeMy.height + 60);
    else
        return (sizeMy.height + sizeOther.height + 80);
}


#pragma mark parseoperationdelegate
//- (void)handleLoadedApps:(NSArray *)loadedApps
//{
//    [self.weiboRecords addObjectsFromArray:loadedApps];
//    
//    // tell our table view to reload its data, now that parsing has completed
//    [self.recordTable reloadData];
//}
- (void)didFinishParsing:(Result *)result
{
//    [self performSelectorOnMainThread:@selector(handleLoadedApps:) withObject:weiboList waitUntilDone:NO];
    self.result = result;
    [self.recordTable reloadData];
}

- (void)parseErrorOccurred:(NSError *)error
{
    
}
#pragma mark icondownloaddelegate
- (void)appImageDidLoad:(NSIndexPath *)indexPath
{
    
}
#pragma mark uiscrolldelegate
- (void)processBusinessNotify:(int)notifcationId withInParam:(id)inParam
{
    //根据参数刷新界面
    NSLog(@"sucess");
    switch (notifcationId) {
        case MakeID(time_line, other):{
            [self.activity removeFromSuperview];
            Result *re = (Result *)inParam;
            self.result = re;
            [self.recordTable reloadData];
            [self.updateButton setEnabled:YES];
            self.recordTable.hidden = NO;
        }
            break;
        case MakeID(time_line, headdownload):
        {
            NSIndexPath *path = (NSIndexPath *)inParam;
            UIImage *image = [[self.result.data.infos objectAtIndex:path.row] headImage];
            UITableViewCell *cell = [self.recordTable cellForRowAtIndexPath:path];
            if([[[[self.result.data.infos objectAtIndex:path.row] source] text] isEqualToString:@""])
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
- (void)update:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    [btn setEnabled:NO];
    BusinessFramework *framw = [BusinessFramework defaultBusinessFramework];
    [framw callBusinessProcess:MakeID(time_line, home_timeline) withInParam:nil andOutParam:nil];
}
- (void)write:(id)sender
{
    WriteController *write = [[WriteController alloc] init];
    [self.navigationController pushViewController:write animated:YES];
    [write release];
}

- (void)startIconDownload:(Info *)appRecord forIndexPath:(NSIndexPath *)indexPath
{
    if(appRecord.headImage == nil)
    {
        BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:appRecord,@"record",indexPath,@"path", @"homepage",@"class",nil];
        [frame callBusinessProcess:MakeID(time_line, headdownload) withInParam:dic andOutParam:nil];
    }
}

- (void)loadImagesForOnscreenRows
{
    if ([self.result.data.infos count] > 0)
    {
        NSArray *visiblePaths = [self.recordTable indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            Info *info = [self.result.data.infos objectAtIndex:indexPath.row];
            
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
