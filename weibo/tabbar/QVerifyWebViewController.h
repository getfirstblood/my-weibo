//
//  QVerifyWebViewController.h
//  QWeiboSDK4iOSDemo
//
//  Created   on 11-1-14.
//   
//

#import <UIKit/UIKit.h>
@class tabbarViewController;

@interface QVerifyWebViewController : UIViewController<UIWebViewDelegate> {
	
	UIWebView *mWebView;
}
- (void) drawTableBarView;
@end
