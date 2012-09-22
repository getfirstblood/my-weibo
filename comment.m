//
//  comment.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-27.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "comment.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
@implementation comment
@synthesize text = text_;
@synthesize tag = tag_;
@synthesize weiboid = weiboid_;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 5, 38, 38);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goback:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = back;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(305, 5, 38, 38);
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightbutton;
    [self.text becomeFirstResponder];
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
- (void)goback:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)confirm:(id)sender
{
    BusinessFramework *frame = [BusinessFramework defaultBusinessFramework];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.text.text,@"content",self.weiboid,@"reid", nil];
    if([self.tag isEqualToString:@"zhuan"])
        [frame callBusinessProcess:MakeID(weibo_Relation, re_add) withInParam:dic andOutParam:nil];
    else
        [frame callBusinessProcess:MakeID(weibo_Relation, commentt) withInParam:dic andOutParam:nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" 
                                                    message:@"sucess"
                                                   delegate:nil
                                          cancelButtonTitle:@"ok!" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    self.text.text = @"";
}

@end
