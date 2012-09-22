//
//  tabbarViewController.m
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import "tabbarViewController.h"
#import "HomePage.h"
#import "Mention.h"
#import "Squar.h"
#import "PrivateLetter.h"
#import "Information.h"
#import "QWeiboSyncApi.h"
#import "tabbarAppDelegate.h"
#import "QVerifyWebViewController.h"
@implementation tabbarViewController
- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
#pragma mark - custom methods
- (void)drawTableBarView
{
    UITabBarController *tabBar=[[UITabBarController alloc] init];
    HomePage *weiBoHomePage=[[HomePage alloc] init];
    weiBoHomePage.title=@"提及";
    UINavigationController *homePageNav=[[UINavigationController alloc] initWithRootViewController:weiBoHomePage];
    [weiBoHomePage release];
    homePageNav.tabBarItem.title=@"提及";
    homePageNav.tabBarItem.image=[UIImage imageNamed:@""];
    
    Mention *weiBoMention=[[Mention alloc] init];
    weiBoMention.title=@"主页";
    UINavigationController *mentionNav=[[UINavigationController alloc] initWithRootViewController:weiBoMention];
    [weiBoMention release];
    mentionNav.tabBarItem.title=@"主页";
    mentionNav.tabBarItem.image=[UIImage imageNamed:@""];
    
    Squar *weiBoSquar=[[Squar alloc] init];
    weiBoSquar.title=@"广场";
    UINavigationController *squarNav=[[UINavigationController alloc] initWithRootViewController:weiBoSquar];
    [weiBoSquar release];
    squarNav.tabBarItem.title=@"广场";
    squarNav.tabBarItem.image=[UIImage imageNamed:@""];
    
    PrivateLetter *weiBoPrivateLetter=[[PrivateLetter alloc] init];
    weiBoPrivateLetter.title=@"私信";
    UINavigationController *privateLetterNav=[[UINavigationController alloc] initWithRootViewController:weiBoPrivateLetter];
    [weiBoPrivateLetter release];
    privateLetterNav.tabBarItem.title=@"私信";
    privateLetterNav.tabBarItem.image=[UIImage imageNamed:@""];
    
    Information *weiBoInformation=[[Information alloc] init];
    weiBoInformation.title=@"资料";
    UINavigationController *informationNav=[[UINavigationController alloc] initWithRootViewController:weiBoInformation];
    [weiBoInformation release];
    informationNav.tabBarItem.title=@"资料";
    informationNav.tabBarItem.image=[UIImage imageNamed:@""];
    
    NSArray *ctrlArray=[[NSArray alloc] initWithObjects:mentionNav,homePageNav,informationNav, nil];
    tabBar.viewControllers=ctrlArray;
    tabBar.selectedIndex=0;
    [ctrlArray release];
    [homePageNav release];
    [mentionNav release];
    [squarNav release];
    [privateLetterNav release];
    [informationNav release];
    tabBar.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:tabBar animated:YES];
    [tabBar release];
}
#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"授权";
    tabbarAppDelegate *appDelegate = 
    (tabbarAppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.appKey=@"801111913";
    appDelegate.appSecret=@"218f8079769a984219a13580ca0432c9";
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
#pragma mark event methods
- (IBAction) tWeiBo:(id)send
{
    tabbarAppDelegate *appDelegate = 
    (tabbarAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (appDelegate.tokenKey && ![appDelegate.tokenKey isEqualToString:@""] && 
        appDelegate.tokenSecret && ![appDelegate.tokenSecret isEqualToString:@""]) {
        [self drawTableBarView];
    } else {
        
        QWeiboSyncApi *api = [[[QWeiboSyncApi alloc] init] autorelease];
        NSString *retString = [api getRequestTokenWithConsumerKey:appDelegate.appKey consumerSecret:appDelegate.appSecret];
        NSLog(@"Get requestToken:%@", retString);
        
        [appDelegate parseTokenKeyWithResponse:retString];
        
        QVerifyWebViewController *verifyController = 
        [[QVerifyWebViewController alloc] init];
        
        [appDelegate.navigationController pushViewController:verifyController animated:YES];
        [verifyController release];
    }
}
- (IBAction) xWeiBo:(id)send
{
    tabbarAppDelegate *appDelegate = 
    (tabbarAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (appDelegate.tokenKey && ![appDelegate.tokenKey isEqualToString:@""] && 
        appDelegate.tokenSecret && ![appDelegate.tokenSecret isEqualToString:@""]) {
        [self drawTableBarView];
    } else {
        
        QWeiboSyncApi *api = [[[QWeiboSyncApi alloc] init] autorelease];
        NSString *retString = [api getRequestTokenWithConsumerKey:appDelegate.appKey consumerSecret:appDelegate.appSecret];
        NSLog(@"Get requestToken:%@", retString);
        
        [appDelegate parseTokenKeyWithResponse:retString];
        
        QVerifyWebViewController *verifyController = 
        [[QVerifyWebViewController alloc] init];
        [appDelegate.navigationController pushViewController:verifyController animated:YES];
        [verifyController release];
    }
}

@end
