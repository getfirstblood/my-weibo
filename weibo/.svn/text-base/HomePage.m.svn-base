//
//  HomePage.m
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "HomePage.h"
#import "CellInformation.h"
#import "BroadcastMessageCell.h"
#import "BroadCastMessageCellNew.h"
#import "MentionDetailsViewController.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"

@interface HomePage ()

- (void)startIconDownload:(Info *)appRecord forIndexPath:(NSIndexPath *)indexPath;
- (void)loadImagesForOnscreenRows;
@end

@implementation HomePage

@synthesize broadcastView = broadcastView_;
//@synthesize cellInfoArr = cellInfoArr_;
@synthesize index = index_;
@synthesize ret = ret_;
@synthesize activity = activity_;
//@synthesize cellInfo = cellInfo_;

//- (NSInteger)getRowAtIndex
//{
//    NSInteger number = self.row;
//    NSLog(@"%d",number);
//    
//    return number;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [broadcastView_ release];
 //   [cellInfoArr_ release];
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
    [frame callBusinessProcess:MakeID(time_line, mentions_timeline) withInParam:nil andOutParam:nil];
    [frame registerBusinessListener:self];
//    CellInformation *info1 = [[CellInformation alloc] init];
//    CellInformation *info2 = [[CellInformation alloc] init];
//    CellInformation *info3 = [[CellInformation alloc] init];
//    CellInformation *info4 = [[CellInformation alloc] init];
//    
//    UIImage *head1 = [UIImage imageNamed: @"001.png"];
//    UIImage *head2 = [UIImage imageNamed:@"002.png"];
//    UIImage *head3 = [UIImage imageNamed: @"003.png"];
//    UIImage *head4 = [UIImage imageNamed:@"004.png"];
//    info1.headImage = head1;
//    info2.headImage = head2;
//    info3.headImage = head3;
//    info4.headImage = head4;
//    
//    NSString *name1 = [[NSString  alloc] initWithFormat:@"张强"];
//    NSString *name2 = [[NSString  alloc] initWithFormat:@"李大海"];
//    NSString *name3 = [[NSString  alloc] initWithFormat:@"孙斌"];
//    NSString *name4 = [[NSString  alloc] initWithFormat:@"刘研"];
//    info1.userName = name1;
//    info2.userName = name2;
//    info3.userName = name3;
//    info4.userName = name4;
//    [name1 release];
//    [name2 release];
//    [name3 release];
//    [name4 release];
//    
// 
//    NSString *bdtime1 = [[NSString alloc] initWithFormat:@"13分钟前"];
//    NSString *bdtime2 = [[NSString alloc] initWithFormat:@"25分钟前"];
//    NSString *bdtime3 = [[NSString alloc] initWithFormat:@"1小时前"];
//    NSString *bdtime4 = [[NSString alloc] initWithFormat:@"2天前"];
//    info1.broadcastTime = bdtime1;
//    info2.broadcastTime = bdtime2;
//    info3.broadcastTime = bdtime3;
//    info4.broadcastTime = bdtime4;
//    
//    [bdtime1 release];
//    [bdtime2 release];
//    [bdtime3 release];
//    [bdtime4 release];
//    
//    NSString *my1 = [[NSString alloc] initWithFormat:@"辅导费辅导；豆腐块贷款方乱砍滥伐卡德罗夫豆腐块代理！"];
//    NSString *my2 = [[NSString alloc] initWithFormat:@"一份耕耘一份收获放得开发咯人民东方人批，小辅导费大幅度辅导费的‘’啊辅导费发 fe东方东方的的的辅导辅导辅导"];
//    NSString *my3 = [[NSString alloc] initWithFormat:@"武夷上校！"];
//    NSString *my4 = [[NSString alloc] initWithFormat:@"草拟吗可靠度打瞌睡里卡多塑料的电视打瞌睡了的斯大林山东快书楼道口塑料袋凯瑟琳侃大山楼道口塑料袋可！"];
//    info1.mySpeech = my1;
//    info2.mySpeech = my2;
//    info3.mySpeech = my3;
//    info4.mySpeech = my4;
//    [my1 release];
//    [my2 release];
//    [my3 release];
//    [my4 release];
//    
//    
//    NSString *other1 = [[NSString alloc] initWithFormat:@""];
//    NSString *other2 = [[NSString alloc] initWithFormat:@""];
//    NSString *other3 = [[NSString alloc] initWithFormat:@"俄方觉得哦发塑料袋是丹江口电视剧大家塑料克林顿塑料电视；额度凯瑟琳打瞌睡楼道口塑料袋凯瑟琳第十六凯瑟琳打瞌睡楼道口塑料袋凯瑟琳昆德拉斯达康德克勒克塑料打瞌睡德雷克斯勒第十六电视卡娄底市昆德拉时空电视卡打瞌睡德雷斯顿凯瑟琳打瞌睡楼道口!"];
//    NSString *other4 = [[NSString alloc] initWithFormat:@"分类法多孔菌科大酒店快乐得到山东省的颠三倒四电视第三代的是电视电视电视的山东是电视!"];
//    info1.othersSpeech = other1;
//    info2.othersSpeech = other2;
//    info3.othersSpeech = other3;
//    info4.othersSpeech = other4;
//    
//    [other1 release];
//    [other2 release];
//    [other3 release];
//    [other4 release];
//    
//    NSString *fr1 = [[NSString alloc] initWithFormat:@"iphone"];
//    NSString *fr2 = [[NSString alloc] initWithFormat:@"Android"];
//    NSString *fr3 = [[NSString alloc] initWithFormat:@"网页"];
//    NSString *fr4 = [[NSString alloc] initWithFormat:@"手机"];
//    info1.from = fr1;
//    info2.from = fr2;
//    info3.from = fr3;
//    info4.from = fr4;
//    [fr1 release];
//    [fr2 release];
//    [fr3 release];
//    [fr4 release];
//    
//    
//    NSString *tmCount1 = [[NSString alloc] initWithFormat:@"12"];
//    NSString *tmCount2 = [[NSString alloc] initWithFormat:@"7"];
//    NSString *tmCount3 = [[NSString alloc] initWithFormat:@"58"];
//    NSString *tmCount4 = [[NSString alloc] initWithFormat:@"11123"];
//    info1.tramitCount = tmCount1;
//    info2.tramitCount = tmCount2;
//    info3.tramitCount = tmCount3;
//    info4.tramitCount = tmCount4;
//    [tmCount1 release];
//    [tmCount2 release];
//    [tmCount3 release];
//    [tmCount4 release];
//    
//    
//    NSString *ctCount1 = [[NSString alloc] initWithFormat:@"2"];
//    NSString *ctCount2 = [[NSString alloc] initWithFormat:@"252"];
//    NSString *ctCount3 = [[NSString alloc] initWithFormat:@"142"];
//    NSString *ctCount4 = [[NSString alloc] initWithFormat:@"98"];
//    info1.commentCount = ctCount1;
//    info2.commentCount = ctCount2;
//    info3.commentCount = ctCount3;
//    info4.commentCount = ctCount4;
//    [ctCount1 release];
//    [ctCount2 release];
//    [ctCount3 release];
//    [ctCount4 release];
//    
//    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
//    [tmpArr addObject:info1];
//    [tmpArr addObject:info2];
//    [tmpArr addObject:info3];
//    [tmpArr addObject:info4];
//    
//    self.cellInfoArr = tmpArr;
//    
//  
//    [info1 release];
//    [info2 release];
//    [info3 release];
//    [info4 release];
//    
//    [tmpArr release];
//    
    self.broadcastView.hidden = YES;
    [self.activity startAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.broadcastView = nil;
    //self.cellInfoArr = nil;

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    static NSString *broadcastCellIdentifier = @"broadcastCellIdentifier";
    BroadcastMessageCell *cell = (BroadcastMessageCell *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    BroadCastMessageCellNew *cellNew = (BroadCastMessageCellNew *)[tableView dequeueReusableCellWithIdentifier:broadcastCellIdentifier];
    //CellInformation *info = [self.cellInfoArr objectAtIndex:row];;
    
    Info *info = [self.ret.data.infos objectAtIndex:row];
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
        cellNew.from.frame = CGRectMake(20, sizeMy.height + 35, 120, 20);
        cellNew.from.text = @"来自";
        cellNew.whereFrom.frame = CGRectMake(70, sizeMy.height + 35, 50, 20);
        cellNew.whereFrom.text = info.from;
        cellNew.manyTransmit.frame = CGRectMake(220, sizeMy.height + 35, 50, 20);
        cellNew.manyTransmit.text = info.count;
        cellNew.manyComment.frame = CGRectMake(270, sizeMy.height + 35, 50, 20);
        cellNew.manyComment.text = info.mcount;
        
        if (!info.headImage)
        {
            if (self.broadcastView.dragging == NO && self.broadcastView.decelerating == NO)
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
            if (self.broadcastView.dragging == NO && self.broadcastView.decelerating == NO)
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    self.index = row;
    MentionDetailsViewController *viewController= [[MentionDetailsViewController alloc] init];
    viewController.mention = self;
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.title = @"Detail Infomation";
    [viewController release];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
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
        case MakeID(time_line, mentions_timeline):{
            self.ret = (Result *)inParam;
            [self.broadcastView reloadData];
            self.broadcastView.hidden = NO;
            [self.activity removeFromSuperview];
        }
            break;
        case MakeID(time_line, headdownload3):
        {
            NSIndexPath *path = (NSIndexPath *)inParam;
            UIImage *image = [[self.ret.data.infos objectAtIndex:path.row] headImage];
            UITableViewCell *cell = [self.broadcastView cellForRowAtIndexPath:path];
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
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:appRecord,@"record",indexPath,@"path", @"mention",@"class",nil];
        [frame callBusinessProcess:MakeID(time_line, headdownload) withInParam:dic andOutParam:nil];
    }
}

- (void)loadImagesForOnscreenRows
{
    if ([self.ret.data.infos count] > 0)
    {
        NSArray *visiblePaths = [self.broadcastView indexPathsForVisibleRows];
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
