//
//  WriteController.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-16.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "WriteController.h"
#import "BusinessFramework.h"
#import "ModuleTypeDef.h"
@implementation WriteController

@synthesize imageView = imageView_;
@synthesize takePictureBtn = takePictureBtn_;
@synthesize selectPictureBtn = selectPictureBtn_;
@synthesize field = field_;
@synthesize fileurl = fileurl_;

- (IBAction)getCameraPicture:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = (sender == self.takePictureBtn) ? UIImagePickerControllerSourceTypeCamera:UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentModalViewController:picker animated:YES];
    [picker release];
}

- (IBAction)selectExistingPicture
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:picker animated:YES];
        [picker release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error accessing photo library" 
                                                 message:@"Device does not support a photo library"
                                                 delegate:nil
                                                 cancelButtonTitle:@"Drat!" 
                                                 otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }
}

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
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.takePictureBtn.hidden = YES;
    }
    [self.field becomeFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
    self.takePictureBtn = nil;
    self.selectPictureBtn = nil;
}

- (void)dealloc
{
    [imageView_ release];
    [takePictureBtn_ release];
    [selectPictureBtn_ release];
    [super dealloc];
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
    if([self.field.text isEqualToString:@""] || self.field.text == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert!" 
                                                        message:@"content empty"
                                                       delegate:nil
                                              cancelButtonTitle:@"ok!" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    else 
    {
        if(self.imageView.image == nil)
        {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.field.text,@"content", nil];
        [frame callBusinessProcess:MakeID(weibo_Relation, add) withInParam:dic andOutParam:nil];
        }
        else
        {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.field.text,@"content",self.fileurl,@"path", nil];
        [frame callBusinessProcess:MakeID(weibo_Relation, addpic) withInParam:dic andOutParam:nil];
        }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"sucess!" 
                                                    message:@"sucess"
                                                   delegate:nil
                                          cancelButtonTitle:@"ok!" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    self.field.text = @"";
    self.imageView.image = nil;
    }
}


#pragma mark -
#pragma UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.imageView.image = image;
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingFormat:@"temp.png"];
    [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];
    self.fileurl = filePath;
    [picker dismissModalViewControllerAnimated:YES];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

@end
