//
//  TRAreaViewController.m
//  Demo1_PropertyList
//
//  Created by apple on 13-6-28.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAreaViewController.h"

@interface TRAreaViewController ()

@end

@implementation TRAreaViewController

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
    self.title = self.area.areaName;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.area.subAreas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *BigAreaCellIdentifier = @"Area Cell";
    static NSString *AreaCellIdentifir = @"Area Cell 2";
    
    TRArea * subArea = self.area.subAreas[indexPath.row];
    
    UITableViewCell * cell = nil;
    if (subArea.subAreas.count > 0) {
        cell = [tableView
        dequeueReusableCellWithIdentifier:BigAreaCellIdentifier
                forIndexPath:indexPath];
    } else {
        cell = [tableView
        dequeueReusableCellWithIdentifier:AreaCellIdentifir
                forIndexPath:indexPath];
    }
    cell.textLabel.text = subArea.areaName;
    return cell;
}

//-(void) tableView:(UITableView *)tableView
//    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    TRAreaViewController * areaViewController =
//    [self.storyboard instantiateViewControllerWithIdentifier:
//     @"Area View Controller"];
//    areaViewController.area = self.area.subAreas[indexPath.row];
//    
//}

-(void) prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Sub Area Segue"]) {
        TRAreaViewController * destination =
        segue.destinationViewController;
        NSIndexPath * indexPath =
        [self.tableView indexPathForCell:sender];
        destination.area = self.area.subAreas[indexPath.row];
    }
}


@end
