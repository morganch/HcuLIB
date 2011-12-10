//
//  DetailViewController.h
//  HcuLIB
//
//  Created by morgan chang on 2011/11/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate, UIWebViewDelegate>
{
  NSString *pageURL;
	UIWebView *webView;
  UIPopoverController *popoverController;
	id detailItem;
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *pageURL;

//add webview here
//@property (retain,nonatomic) WebViewController *webViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pageURL:(NSString *)pageurl;
@end
