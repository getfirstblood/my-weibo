//
//  Information.m
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "Information.h"
#import "MyBroadCastViewController.h"
#import "MyListenersViewController.h"
#import "MyAttentionViewController.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
#import "CollectViewController.h"
#import "ModuleTypeDef.h"

@implementation Information

@synthesize headImage = headImage_;
@synthesize nameLabel = nameLabel_;
@synthesize editBtn = editBtn_;
@synthesize broadcastBtn = broadcastBtn_;
@synthesize listenerBtn = listenerBtn_;
@synthesize attentionBtn = attentionBtn_;
@synthesize topicBtn = topicBtn_;
@synthesize infoView = infoView_;
@synthesize infoArr = infoArr_;
@synthesize ret = ret_;
@synthesize down = down_;

- (IBAction)editBtnClick
{
    NSLog(@"editBtnClick.....");
    self.down = [[[download alloc] init] autorelease];
    self.down.ret = self.ret;
    self.down.delegate = self;
    [self.down startDownload];
    
}
- (void)head
{
    self.down = [[[download alloc] init] autorelease];
    self.down.ret = self.ret;
    self.down.delegate = self;
    [self.down startDownload];
}
- (IBAction)broadcastBtnClick
{
    MyBroadCastViewController *broadcastView = [[MyBroadCastViewController alloc] init];
    [self.navigationController pushViewController:broadcastView animated:YES];
    [broadcastView release];
}

- (IBAction)listenersBtnClick
{
    MyListenersViewController *listenersView = [[MyListenersViewController alloc] init];
    [self.navigationController pushViewController:listenersView animated:YES];
    [listenersView release];
    
}

- (IBAction)attentionBtnClick
{
    MyAttentionViewController *attentionView = [[MyAttentionViewController alloc] init];
    [self.navigationController pushViewController:attentionView animated:YES];
    [attentionView release];
}

- (IBAction)topicBtnClick
{
    NSLog(@"topicBtnClick.....");
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
    [headImage_ release];
    [nameLabel_ release];
    [editBtn_ release];
    [broadcastBtn_ release];
    [listenerBtn_ release];
    [attentionBtn_ release];
    [topicBtn_ release];
    [infoView_ release];
    [infoArr_ release];
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
    [frame callBusinessProcess:MakeID(account_Relation, info) withInParam:nil andOutParam:nil];
    [self performSelector:@selector(head) withObject:nil afterDelay:6];
    self.headImage.image = [UIImage imageNamed:@"003.png"];
    self.nameLabel.text = @"－－－";
    [self.infoView setBackgroundColor:[UIColor clearColor]];
    
    NSMutableArray *tmp = [[NSMutableArray alloc]initWithObjects:@"收藏",@"话题订阅",@"黑名单", nil];
    self.infoArr = tmp;
    [tmp release];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] init];
    leftBtn.title = @"Back";
    self.navigationItem.backBarButtonItem = leftBtn;
    [leftBtn release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.headImage = nil;
    self.nameLabel = nil;
    self.editBtn = nil;
    self.broadcastBtn = nil;
    self.listenerBtn = nil;
    self.attentionBtn = nil;
    self.topicBtn = nil;
    self.infoView = nil;
    self.infoArr = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table Data Source Methos

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.infoArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    static NSString *InfoCell = @"InfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InfoCell];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:InfoCell] autorelease];
    }
    
    cell.textLabel.text = [self.infoArr objectAtIndex:row];
    
    return cell;
    
}

#pragma mark Table Delegate Methos
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (row == 0)
    {
        CollectViewController *collectView = [[CollectViewController alloc] init];
        [self.navigationController pushViewController:collectView animated:YES];
        [collectView release];
    }
}

- (void)processBusinessNotify:(int)notifcationId withInParam:(id)inParam
{
    NSLog(@"sucess");
    switch (notifcationId) {
        case MakeID(account_Relation, info):
        {
            self.ret = (infoResult *)inParam;
            [self.broadcastBtn setTitle:[NSString stringWithFormat:@"广播    %@",self.ret.data.tweetnum] forState:UIControlStateNormal];
            [self.listenerBtn setTitle:[NSString stringWithFormat:@"广播    %@",self.ret.data.idolnum] forState:UIControlStateNormal];
            [self.attentionBtn setTitle:[NSString stringWithFormat:@"广播    %@",self.ret.data.fansnum] forState:UIControlStateNormal];
            self.nameLabel.text = self.ret.data.name;
            //chufaxiazai touxiang
//            BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
//            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"info",@"class", self.ret,@"result", nil];
//            [frame callBusinessProcess:MakeID(time_line, headdownload) withInParam:dic andOutParam:nil];
            self.down = [[[download alloc] init] autorelease];
            self.down.ret = self.ret;
            self.down.delegate = self;
            [self.down startDownload];
            
        }
            break;
//        case MakeID(account_Relation, head):
//        {
//            self.headImage.image = self.ret.data.headImage;
//        }
//            break;
        default:
            break;
    }
}
- (void)appImageDidLoad
{
    self.headImage.image = self.ret.data.headImage;
}
@end
