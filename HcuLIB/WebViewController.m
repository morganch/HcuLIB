//
//  MainViewController.m
//  WebWithUtilityApplication
//
//  Created by Chakra on 29/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "WebViewController.h"
#import "myWebView.h"
#import "WebModel.h"


@implementation WebViewController

@synthesize displayWeb;
@synthesize fullPath;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil fullpath:(NSString *)filePath{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        fullPath = filePath;
    }
    return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
/*- (void)loadView {
	
	
}*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	displayWeb.userInteractionEnabled = true;

/*
	if(!displayWeb) {
		[displayWeb loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://www.google.com"]]];
  }
*/
// change to read the pdf file...

//	NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
//	WebModel *wModel = [[WebModel alloc]init];
//	NSURL *url = [NSURL fileURLWithPath:defaultPath];
//	NSURL *url = [NSURL fileURLWithPath:fullPath];
//using real URL here...
    NSURL *url = [[NSURL alloc] initWithString:fullPath];
    NSLog(@"the input full path : %@",fullPath);
//	NSURL *url = [NSURL fileURLWithPath:wModel.fullPath];
//	[wModel release];
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

	[displayWeb loadRequest:requestObj];

	[displayWeb setScalesPageToFit:YES];

    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
		[displayWeb release];
		[fullPath release];
    [super dealloc];
}


@end
