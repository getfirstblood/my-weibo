//
//  MyAttentionViewController.m
//  tabbar
//
//  Created by ji jijiandong on 12-5-10.
//  Copyright 2012年 cienet. All rights reserved.
//

#import "MyAttentionViewController.h"
#import "MyListenersCell.h"


@implementation MyAttentionViewController

@synthesize attentionView = attentionView_;

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
    [attentionView_ release];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.attentionView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
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
