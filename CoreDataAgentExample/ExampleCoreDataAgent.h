//
//  ExampleCoreDataAgent.h
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import "JBCoreDataAgent.h"
#import "Person.h"
#import "Event.h"

@interface ExampleCoreDataAgent : JBCoreDataAgent
@property (nonatomic, strong) NSString *storeName;

-(Person *) firstPerson;
-(Person *) personAtIndexPath: (NSIndexPath *)indexPath;
-(Person *) insertPerson;

-(Event *) eventAtIndexPath: (NSIndexPath *)indexPath;
-(Event *) insertEvent;

@end
