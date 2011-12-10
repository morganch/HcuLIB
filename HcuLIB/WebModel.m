//
//  WebModel.m
//  UtilApp
//
//  Created by morgan chang on 2011/11/11.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebModel.h"

@implementation WebModel

@synthesize fullPath;

-(id)init
{
	NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
	fullPath = defaultPath;
	return self;
}
@end
