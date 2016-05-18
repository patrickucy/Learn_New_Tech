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
    [self iterateArea:rootArea withNode:rootAreaNode];
    return rootArea;
}
- (void) iterateArea:(TRArea *)area
            withNode:(NSDictionary *)node
{
    //area 地区对象                 node 地区结点
    //subAreas  子地区对象数组       subAreaNodes  子地区结点数组
    //subArea   子地区对象          subAreaNode  子地区结点
    area.areaName = node[@"name"];
    NSArray * subAreaNodes = node[@"subAreas"];
    NSMutableArray * subAreas = [NSMutableArray array];
    for (NSDictionary * subAreaNode in subAreaNodes){
        TRArea * subArea = [[TRArea alloc] init];
        [self iterateArea:subArea withNode:subAreaNode];
        [subAreas addObject:subArea];
    }
    area.subAreas = [subAreas copy];
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
