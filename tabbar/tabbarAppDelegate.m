//
//  tabbarAppDelegate.m
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//
#import "GlobalObjectCenter.h"
#import "tabbarAppDelegate.h"
#import "NSURL+QAdditions.h"

#import "tabbarViewController.h"
#define AppKey			@"appKey"
#define AppSecret		@"appSecret"
#define AppTokenKey		@"tokenKey"
#define AppTokenSecret	@"tokenSecret"
@implementation tabbarAppDelegate
@synthesize appKey=appKey_;
@synthesize appSecret=appSecret_;
@synthesize tokenKey=tokenKey_;
@synthesize tokenSecret=tokenSecret_;
@synthesize verifier=verifier_;
@synthesize response=response_;
@synthesize navigationController=navigationController_;

@synthesize window=_window;

@synthesize viewController=_viewController;

- (void)loadDefaultKey
{
    self.appKey = [[NSUserDefaults standardUserDefaults] valueForKey:AppKey];
	self.appSecret = [[NSUserDefaults standardUserDefaults] valueForKey:AppSecret];
	self.tokenKey = [[NSUserDefaults standardUserDefaults] valueForKey:AppTokenKey];
	self.tokenSecret = [[NSUserDefaults standardUserDefaults] valueForKey:AppTokenSecret];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GlobalObjectCenter initBusinessModules];
    [self loadDefaultKey];
    // Override point for customization after application launch.
    self.navigationController=[[[UINavigationController alloc] initWithRootViewController:self.viewController] autorelease];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [appKey_ release];
    [appSecret_ release];
    [navigationController_ release];
    [tokenSecret_ release];
    [tokenKey_ release];
    [response_ release];
    [verifier_ release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (void)parseTokenKeyWithResponse:(NSString *)response
{
    NSDictionary *params = [NSURL parseURLQueryString:response];
	self.tokenKey = [params objectForKey:@"oauth_token"];//request TOKEN
	self.tokenSecret = [params objectForKey:@"oauth_token_secret"];
}
- (void)saveDefaultKey
{
    [[NSUserDefaults standardUserDefaults] setValue:self.appKey forKey:AppKey];
    [[NSUserDefaults standardUserDefaults] setValue:self.appSecret forKey:AppSecret];
	[[NSUserDefaults standardUserDefaults] setValue:self.tokenKey forKey:AppTokenKey];
	[[NSUserDefaults standardUserDefaults] setValue:self.tokenSecret forKey:AppTokenSecret];
	[[NSUserDefaults standardUserDefaults] synchronize];
}
- (UIViewController *)mainViewController
{
    return self.navigationController;
}

@end
