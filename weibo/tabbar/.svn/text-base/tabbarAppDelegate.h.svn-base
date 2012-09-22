//
//  tabbarAppDelegate.h
//  tabbar
//
//  Created by 伟伟 高 on 3/27/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tabbarViewController;

@interface tabbarAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationController      *navigationController_;
    NSString                    *appKey_;
    NSString                    *appSecret_;
    NSString                    *tokenKey_;
    NSString                    *tokenSecret_;
    NSString                    *verifier_;
    NSString                    *response_;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet tabbarViewController *viewController;
@property (nonatomic, retain) UINavigationController        *navigationController;
@property (nonatomic, copy) NSString   *appKey;
@property (nonatomic, copy) NSString   *appSecret;
@property (nonatomic, copy) NSString   *tokenKey;
@property (nonatomic, copy) NSString   *tokenSecret;
@property (nonatomic, copy) NSString   *verifier;
@property (nonatomic, copy) NSString   *response;

- (void) parseTokenKeyWithResponse:(NSString *)response;
- (void) saveDefaultKey;
- (UIViewController *)mainViewController;

@end
