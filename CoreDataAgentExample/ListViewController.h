//
//  ListViewController.h
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleCoreDataAgent.h"

@interface ListViewController : UITableViewController
@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) ExampleCoreDataAgent *coreDataAgent;

@end
