//
//  MyBroadCastViewController.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-9.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "MyBroadCastViewController.h"
#import "MyBroadCastCell.h"


@implementation MyBroadCastViewController

@synthesize myBroadcastView = myBroadcastView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [myBroadcastView_ release];
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.myBroadcastView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myBroadCastCell = @"myBroadCastCell";
    MyBroadCastCell *cell = (MyBroadCastCell *)[tableView dequeueReusableCellWithIdentifier:myBroadCastCell];
    NSArray *nib = nil;
    
    if(nil == cell)
    {
        nib = [[NSBundle mainBundle] loadNibNamed:@"MyBroadCastCell" owner:self options:nil];
        for (id oneobj in nib)
        {
            if ([oneobj isKindOfClass:[MyBroadCastCell class]])
                cell = (MyBroadCastCell *)oneobj;
        }
        
    }
    
    cell.userNameLabel.text = @"季建栋";    
    return cell;
}


@end
