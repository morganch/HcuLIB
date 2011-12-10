//
//  AppDelegate.m
//  HcuLIB
//
//  Created by morgan chang on 2011/11/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"

#import "DetailViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize splitViewController = _splitViewController;

- (void)dealloc
{
	[_window release];
	[_navigationController release];
	[_splitViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil] autorelease];
	    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
	    self.window.rootViewController = self.navigationController;
	} else {
	    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController_iPad" bundle:nil] autorelease];
	    UINavigationController *masterNavigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
	    
	    DetailViewController *detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil] autorelease];
	    UINavigationController *detailNavigationController = [[[UINavigationController alloc] initWithRootViewController:detailViewController] autorelease];
//add background image...
		NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"school_banner" ofType:@"png"];

		NSURL *url = [NSURL fileURLWithPath:defaultPath];

		NSData *data = [NSData dataWithContentsOfURL:url];
		UIImage *image = [[UIImage alloc] initWithData:data];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//        [detailNavigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

		imageView.frame = detailNavigationController.navigationBar.frame;
		[imageView autoresizesSubviews];
//		[detailNavigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//		[detailNavigationController.navigationBar.topItem setTitleView:imageView];
		[imageView release];		

//			UIImage *image = [UIImage imageNamed:@"banner.png"];
//			UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//			[self.navigationController.navigationBar.topItem setTitleView:imageView];
//			[[[[self.splitViewController.viewControllers objectAtIndex:0] navigationBar] topItem] setTitleView:imageView];
//			NSLog(@"load the image: %@",imageView);
//			[imageView release];

//			UINavigationBar *navBar = [[self.splitViewController.viewControllers objectAtIndex:0] navigationBar];
//				UINavigationBar *navBar = detailNavigationController.navigationBar;
//			NSLog(@"the navbar: %@",navBar);
			
//UIImage *image = [UIImage imageNamed:@"yourNavBarBackground.png"];
//			[navBar setBackgroundImage:image];
		
	    self.splitViewController = [[[UISplitViewController alloc] init] autorelease];
	    self.splitViewController.delegate = detailViewController;
	    self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
	    
	    self.window.rootViewController = self.splitViewController;
	}
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

@end
