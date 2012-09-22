//
//  comment.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-27.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface comment : UIViewController
{
    UITextView *text_;
    NSString *tag_;
    NSString *weiboid_;
}
@property (nonatomic, retain)IBOutlet UITextView *text;
@property (nonatomic, copy)NSString *tag;
@property (nonatomic, copy)NSString *weiboid;
- (void)goback:(id)sender;
- (void)confirm:(id)sender;
@end
