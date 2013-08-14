//
//  ViewController.h
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleCoreDataAgent.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) ExampleCoreDataAgent *coreDataAgent;

@property (strong, nonatomic) IBOutlet UILabel *peopleCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventsCountLabel;

@end
