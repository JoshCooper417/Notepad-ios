//
//  JECViewController.m
//  Note Pad
//
//  Created by Joshua Cooper on 3/13/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECViewController.h"
#import "JECDataView.h"
#import "JECData.h"
#import "JECEditFields.h"

#define kJECCellIdentifier @"My Cell Identifier"

@interface JECViewController ()


@end

@implementation JECViewController

CLLocation *userLoc;

- (void)viewDidLoad
{
    NSLog(@"Here");
    self.notes = [[NSMutableArray alloc] init];
    [self addNewOne];
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void) addNewOne
{
    JECData *entry = [[JECData alloc] init];
    entry.title = @"Make a new one";
    entry.assembled = false;
    [_notes addObject:entry];
    NSLog(@"array: %d", [self.notes count]);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kJECCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kJECCellIdentifier];
    }
    JECData *data = self.notes[indexPath.row];
    cell.textLabel.text = data.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JECData *currentEntry =
    _notes[[self.tableView indexPathForSelectedRow].row];

    if(!([currentEntry.assembled isEqualToString:@"Yes"])){
    [self performSegueWithIdentifier:@"Edit Segue" sender:self];
    
    [self addNewOne];
    }
    else{
    
        
     [self performSegueWithIdentifier:@"Data View" sender:self];
     }
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Data View"]) {
        JECDataView *destination = segue.destinationViewController;
        destination.currentEntry =
        _notes[[self.tableView indexPathForSelectedRow].row];
    }
    else if ([segue.identifier isEqualToString:@"Edit Segue"]){
        JECEditFields *destination = segue.destinationViewController;
        destination.currentEntry =
        _notes[[self.tableView indexPathForSelectedRow].row];
    }
}
@end
