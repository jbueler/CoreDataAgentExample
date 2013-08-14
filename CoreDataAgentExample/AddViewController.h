//
//  AddViewController.h
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleCoreDataAgent.h"

@interface AddViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *eventNameField;
@property (strong, nonatomic) IBOutlet UITextField *locationField;

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) ExampleCoreDataAgent *coreDataAgent;


- (IBAction)saveRecord:(id)sender;

@end
