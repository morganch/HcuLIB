//
//  MasterViewController.h
//  HcuLIB
//
//  Created by morgan chang on 2011/11/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UIWebViewDelegate>
{
	NSString* _modelDataFilePath;
	NSMutableDictionary* _model;
	DetailViewController *detailViewController;
}

@property (retain, nonatomic) IBOutlet DetailViewController *detailViewController;
@property (retain, nonatomic) NSString* _modelDataFilePath;
@property (retain, nonatomic) NSMutableDictionary* _model;

@end
