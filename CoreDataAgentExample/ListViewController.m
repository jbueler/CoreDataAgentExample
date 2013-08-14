//
//  ListViewController.m
//  CoreDataAgentExample
//
//  Created by Jeremy Bueler on 8/13/13.
//  Copyright (c) 2013 Jeremy Bueler. All rights reserved.
//

#import "ListViewController.h"
#import "Person.h"
#import "Event.h"

@interface ListViewController ()

@end

@implementation ListViewController

@synthesize entityName = _entityName;
@synthesize coreDataAgent = _coreDataAgent;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	if ([_entityName isEqualToString:@"Person"]) {
		[_coreDataAgent fetchedResultsControllerWithEntityName:@"Person" sortByKey:@"firstname" sectionNameKeyPath:@"lastname" andDelegate:self];
	}
	else{
		[_coreDataAgent fetchedResultsControllerWithEntityName:_entityName];
	}
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_coreDataAgent numberOfSectionsForEntity: _entityName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_coreDataAgent numberOfObjectsForSection:section withName:_entityName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//	Configure the cell to display a person.
	if ([_entityName isEqualToString:@"Person"]) {
		Person * person = [_coreDataAgent personAtIndexPath:indexPath];
		cell.textLabel.text = [@"" stringByAppendingFormat:@"%@ %@", person.firstname, person.lastname];
		cell.detailTextLabel.text = @"";
	}
//	Configure the cell to display an event.
	else if([_entityName isEqualToString:@"Event"]) {
		Event * event = [_coreDataAgent eventAtIndexPath:indexPath];
		cell.textLabel.text = [@"" stringByAppendingFormat:@"%@", event.name];
		cell.detailTextLabel.text = [@"" stringByAppendingFormat:@"%@", event.location];
	}
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return [_coreDataAgent sectionTitle:_entityName forSection:section];
}

@end
