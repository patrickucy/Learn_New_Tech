//
//  TRMainViewController.m
//  Demo1_PropertyList
//
//  Created by apple on 13-6-28.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMainViewController.h"

#import "TRArea.h"
#import "TRAreaViewController.h"

@interface TRMainViewController ()

@end

@implementation TRMainViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (TRArea *)analyseAreaData
{
    NSString * path = [[NSBundle mainBundle]
        pathForResource:@"Areas" ofType:@"plist"];
    
    NSDictionary * rootAreaNode =
        [NSDictionary dictionaryWithContentsOfFile:path];
    
//    NSArray * array = [NSArray arrayWithContentsOfFile:path];
//    NSDictionary * rootAreaNode = array[0];
    
    TRArea * rootArea = [[TRArea alloc] init];
    rootArea.areaName = rootAreaNode[@"name"];
    NSArray * subAreaNodes = rootAreaNode[@"subAreas"];
    NSMutableArray * subAreas = [NSMutableArray array];
    for (NSDictionary * subAreaNode in subAreaNodes){
        TRArea * subArea = [[TRArea alloc] init];
        subArea.areaName = subAreaNode[@"name"];
        //子地区的子地区解析
        [subAreas addObject:subArea];
    }
    rootArea.subAreas = [subAreas copy];
    return rootArea;
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Area Segue"]){
        id destination = segue.destinationViewController;
        [destination setArea:[self analyseAreaData]];
        
//        TRAreaViewController * desitination = segue.destinationViewController;
//        destination.area = [self analyseAreaData];
    }
}

@end
