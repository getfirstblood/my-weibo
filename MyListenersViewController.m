//
//  MyListenersViewController.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-9.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "MyListenersViewController.h"
#import "MyListenersCell.h"


@implementation MyListenersViewController

@synthesize listenersView = listenersView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [listenersView_ release];
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
    self.listenersView = nil;
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
    static NSString *listenerCell = @"listenerCell";
    MyListenersCell *cell = (MyListenersCell *)[tableView dequeueReusableCellWithIdentifier:listenerCell];
    
    NSArray *nib = nil;
    
    if (nil == cell)
    {
        nib = [[NSBundle mainBundle]loadNibNamed:@"MyListenersCell" owner:self options:nil];
        for (id oneobj in nib)
        {
            if ([oneobj isKindOfClass:[MyListenersCell class]])
                cell = (MyListenersCell *)oneobj;
        }
    }
    
    cell.listenNumLabel.text = @"90";
    
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
