//
//  MainViewController.h
//  WebWithUtilityApplication
//
//  Created by Chakra on 29/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController 
{
	IBOutlet UIWebView *displayWeb;
	NSString *fullPath;
}
	
@property (strong,nonatomic)IBOutlet UIWebView *displayWeb;
@property (retain,nonatomic) NSString *fullPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil fullpath:(NSString *)filePath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@end
