//
//  ViewController.m
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize coreDataAgent = _coreDataAgent;
@synthesize peopleCountLabel = _peopleCountLabel;
@synthesize eventsCountLabel = _eventsCountLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated{
	[_coreDataAgent fetchedResultsControllerWithEntityName:@"Person" sortByKey: @"lastname" sectionNameKeyPath:@"lastname" andDelegate:self];
	[_coreDataAgent performFetchForEntityOfName:@"Person"];
	_peopleCountLabel.text = [@"" stringByAppendingFormat: @"%d", [_coreDataAgent numberOfObjectsForEntity:@"Person"]];
	
	[_coreDataAgent fetchedResultsControllerWithEntityName:@"Event" sortByKey:@"name"];
	[_coreDataAgent performFetchForEntityOfName:@"Event"];
	_eventsCountLabel.text = [@"" stringByAppendingFormat: @"%d", [_coreDataAgent numberOfObjectsForEntity:@"Event"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	
	if ([segue.identifier isEqualToString:@"eventsListSegue"]) {
		ListViewController * vc = (ListViewController *) segue.destinationViewController;
		[vc setEntityName: @"Event"];
		[vc setCoreDataAgent: _coreDataAgent];
	}
	else if ([segue.identifier isEqualToString:@"peopleListSegue"]){
		ListViewController * vc = (ListViewController *) segue.destinationViewController;
		[vc setEntityName: @"Person"];
		[vc setCoreDataAgent: _coreDataAgent];
	}
	else if ([segue.identifier isEqualToString:@"addEventSegue"]){
		AddViewController * vc = (AddViewController *) segue.destinationViewController;
		[vc setEntityName: @"Event"];
		[vc setCoreDataAgent: _coreDataAgent];
	}
	else if ([segue.identifier isEqualToString:@"addPersonSegue"]){
		NSLog(@"123456789 %@", _coreDataAgent);
		AddViewController * vc = (AddViewController *) segue.destinationViewController;
		[vc setEntityName: @"Person"];
		[vc setCoreDataAgent: _coreDataAgent];
	}
}

@end
