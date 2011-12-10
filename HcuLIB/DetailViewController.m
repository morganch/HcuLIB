//
//  DetailViewController.m
//  HcuLIB
//
//  Created by morgan chang on 2011/11/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

//@synthesize detailItem = _detailItem;
@synthesize detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize pageURL;
@synthesize webView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pageURL:(NSString *)pageurl{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        pageURL = pageurl;
    }
    return self;
}

- (void)dealloc
{
	[detailItem release];
	[_detailDescriptionLabel release];
	[_masterPopoverController release];
	[webView release];
    
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    NSLog(@"detailItem: %@",newDetailItem);
    if (detailItem != newDetailItem) {
        [detailItem release]; 
        detailItem = [newDetailItem retain]; 
        self.webView.delegate = self;
/*
        //update the webview here
        pageURL = detailItem;
        webViewController = nil;
        webViewController = [[WebViewController alloc] initWithNibName:@"myWebView" bundle:nil fullpath:pageURL];
        NSLog(@"will change the detail view");
        
        self.view = nil;
        
        [self.view addSubview:webViewController.view];
   
 */       
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

	if (self.detailItem) {
	    self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!pageURL) {
        pageURL = @"http://210.60.55.235/Webpac2/msearch.dll/";
    }
//	NSString *defaultPath = @"http://www.hcu.edu.tw";
    //		WebViewController *viewController = [[WebViewController alloc] initWithNibName:@"myWebView" bundle:nil];
//		webView = [[UIWebView alloc] init];
		webView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:pageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
/*
		
    webViewController = [[WebViewController alloc] initWithNibName:@"myWebView" bundle:nil fullpath:pageURL] ; 
    [self.view addSubview:webViewController.view];
*/    
	[self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//		self.title = NSLocalizedString(@"Detail", @"Detail");
			//self.title = @"玄奘大學圖書館";
//add image here

    }
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = NSLocalizedString(@"主選單", @"主選單");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = pc;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
