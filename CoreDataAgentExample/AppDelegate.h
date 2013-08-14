//
//  AppDelegate.h
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleCoreDataAgent.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ExampleCoreDataAgent *coreDataAgent;

@end
