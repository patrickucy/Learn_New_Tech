//
//  TRViewController.m
//  Demo3_TableView_Area_Selection
//
//  Created by apple on 13-6-13.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRAreaViewController.h"

@interface TRViewController()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if(self.selectedArea){
        cell.textLabel.text = self.selectedArea.areaName;
    } else {
        cell.textLabel.text = @"选择地区";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TRAreaViewController * areaViewController =
    [[[TRAreaViewController alloc] initWithNibName:@"TRAreaViewController" bundle:nil] autorelease];
    areaViewController.delegate = self;
    areaViewController.area = [TRArea china];
    
    UINavigationController * navigationController =
    [[[UINavigationController alloc] initWithRootViewController:areaViewController] autorelease];
    
    
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 最终需要的对象覆盖消息处理 不转接不再抛出去（直到找到能响应的人为止）
// -> 接住
- (void)areaViewController:(TRAreaViewController *)areaViewController didSelectArea:(TRArea *)area{
    
    //处理
    self.selectedArea = area;
    [self.tableView reloadData];
}




@end
