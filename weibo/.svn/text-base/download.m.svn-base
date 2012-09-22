//
//  download.m
//  tabbar
//
//  Created by 伟伟 高 on 12-5-27.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#import "download.h"
#define kAppIconHeight 100
@implementation download
@synthesize ret =ret_;
@synthesize delegate =delegate_;
@synthesize data = data_;
@synthesize imageConnection =imageConnection_;

- (void)dealloc
{
    [ret_ release];
    [data_ release];
    [imageConnection_ release];
    [super dealloc];
}
- (void)startDownload
{
    self.data = [NSMutableData data];
    NSString *headrul = [NSString stringWithFormat:@"%@/100",self.ret.data.head];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:headrul]];
    self.imageConnection = [[[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO] autorelease];
    [self.imageConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self.imageConnection start];
}
- (void)cancelDownload
{
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [[UIImage alloc] initWithData:self.data];
    
    if (image.size.width != kAppIconHeight && image.size.height != kAppIconHeight)
	{
        CGSize itemSize = CGSizeMake(kAppIconHeight, kAppIconHeight);
		UIGraphicsBeginImageContext(itemSize);
		CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
		[image drawInRect:imageRect];
		self.ret.data.headImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
    }
    else
    {
        self.ret.data.headImage = image;
    }
    
    self.data= nil;
    [image release];
    
    // Release the connection now that it's finished
    self.imageConnection = nil;
    
    // call our delegate and tell it that our icon is ready for display
    [delegate_ appImageDidLoad];
}
@end
