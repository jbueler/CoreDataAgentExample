//
//  AddViewController.m
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import "AddViewController.h"
#import "Person.h"
#import "Event.h"

@interface AddViewController ()

@end

@implementation AddViewController
@synthesize entityName = _entityName;
@synthesize coreDataAgent = _coreDataAgent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveRecord:(id)sender {
	if ([_entityName isEqualToString:@"Event"]) {
		Event * mo = (Event *)[_coreDataAgent insertEvent];
		mo.name = _eventNameField.text;
		mo.location = _locationField.text;
		NSLog(@"Managed Object %@ = %@", _entityName, mo);
		[_coreDataAgent saveContext];
	}
	else if( [_entityName isEqualToString:@"Person"]){
		Person *mo = (Person *) [_coreDataAgent insertPerson];
		mo.firstname = _firstNameField.text;
		mo.lastname = _lastNameField.text;
		NSLog(@"Managed Object %@ =  %@", _entityName, mo);
		[_coreDataAgent saveContext];
	}
	[self.navigationController popViewControllerAnimated:YES];
}
@end
