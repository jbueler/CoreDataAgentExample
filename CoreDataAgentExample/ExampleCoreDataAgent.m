//
//  ExampleCoreDataAgent.m
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import "ExampleCoreDataAgent.h"

@implementation ExampleCoreDataAgent
@synthesize storeName;

-(Person *) personAtIndexPath:(NSIndexPath *)indexPath{
	return (Person *)[super fetchEntityOfName: @"Person" atIndexPath:indexPath];
}

-(Person *) firstPerson{
	return [self personAtIndexPath:0];
}

-(Person *) insertPerson{
	return (Person *)[self insertEntityWithName:@"Person"];
}

-(Event *) eventAtIndexPath:(NSIndexPath *)indexPath{
	return  (Event *)[self fetchEntityOfName:@"Event" atIndexPath:indexPath];
}

-(Event *) insertEvent{
	return (Event *)[self insertEntityWithName: @"Event"];
}

@end
