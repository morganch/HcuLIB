//
//  MasterViewController.m
//  HcuLIB
//
//  Created by morgan chang on 2011/11/21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@implementation MasterViewController

//@synthesize detailViewController = _detailViewController;
@synthesize _model,_modelDataFilePath;
@synthesize detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
				
		self.title = NSLocalizedString(@"主選單", @"主選單");
		if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		    self.clearsSelectionOnViewWillAppear = NO;
		    self.contentSizeForViewInPopover = CGSizeMake(320.0, 700.0);
		}
    }
    return self;
}
							
- (void)dealloc
{
	[detailViewController release];
	[_model release];
	[_modelDataFilePath release];
    [super dealloc];
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

			//load the data into model...
		// Copy data from resources if it has not been copied already
		NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(
		NSDocumentDirectory, NSUserDomainMask, TRUE) objectAtIndex:0];
		_modelDataFilePath = [documentsPath stringByAppendingPathComponent:@"WebLinks.plist"];
		if ([[NSFileManager defaultManager] fileExistsAtPath:_modelDataFilePath] == FALSE)
		{
			NSString* seedDataPath = [[NSBundle mainBundle] pathForResource:@"WebLinks" ofType:@"plist"];
			[[NSFileManager defaultManager] copyItemAtPath:seedDataPath toPath:_modelDataFilePath error:NULL];
		}
	
		// Load the data set
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:_modelDataFilePath];
        _model = (NSMutableDictionary *)[[NSPropertyListSerialization
            propertyListFromData:plistXML
            mutabilityOption:NSPropertyListMutableContainersAndLeaves
            format:&format
            errorDescription:&errorDesc] retain];
        if (!_model) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }

//		_model = [[NSMutableData alloc] initWithContentsOfFile:_modelDataFilePath];
//		NSLog(@"model: %@",_model);
	// Do any additional setup after loading the view, typically from a nib.

	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
	
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
			[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
	}
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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//	return 3;
	return [_model count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

	NSArray *temp = [[[NSArray alloc] init] autorelease];
//	NSLog(@"section: %@",[[_model allValues] objectAtIndex:section]);
	temp = [[_model allValues] objectAtIndex:section];
	return [temp count];
//	return 1;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

	return [[_model allKeys] objectAtIndex:section];
/*
	switch (section) {
  case 0:
    return @"服務";
    break;
	case 1:
		return @"電子資源";
		break;
	case 2:
		return @"目錄";
		break;
	}
	return @"";
*/
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
		NSDictionary *temp = [[[NSDictionary alloc] init] autorelease];
		temp = [[[_model allValues] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];

//		NSLog(@"cell No: %@",[[temp allKeys] lastObject]);
//    NSString* text = [temp objectAtIndex:[indexPath row]];

	// Configure the cell.
//	cell.textLabel.text = NSLocalizedString(@"Detail", @"Detail");
	cell.textLabel.text = [[temp allKeys] lastObject];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *temp = [[[NSDictionary alloc] init] autorelease];
    temp = [[[_model allValues] objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    NSString *urlstr = [[temp allValues] lastObject];
    NSLog(@"index: %@",[[temp allValues] lastObject]);
    //detailViewController.detailItem = url;
			self.detailViewController.detailItem = urlstr;
//			self.detailViewController.pageURL = urlstr;
//			self.detailViewController.webView.delegate = self;
			self.detailViewController.webView.scalesPageToFit = YES;
			NSURL *url = [NSURL URLWithString:urlstr];
			NSURLRequest *request = [NSURLRequest requestWithURL:url];
			[self.detailViewController.webView loadRequest:request];
						
//    NSLog(@"url: %@",[[_model allValues] objectAtIndex:[indexPath section]]);
//    NSString *url = @"http://www.hcu.edu.tw";
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//	    if (!self.detailViewController) {
	        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil pageURL:urlstr] autorelease];

//	    }
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }

//			[self.detailViewController.webView reload];
 }

@end
