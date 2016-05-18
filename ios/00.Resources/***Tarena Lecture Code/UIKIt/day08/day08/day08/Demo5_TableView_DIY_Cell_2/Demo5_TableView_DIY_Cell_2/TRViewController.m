//
//  TRViewController.m
//  Demo5_TableView_DIY_Cell_2
//
//  Created by apple on 13-6-13.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    //2.调整
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //3.加入
    [self.view addSubview:tableView];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UITextField * textField = nil;
    UILabel * label = nil;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.contentView 就是一个新的任你摆布的空间
        
        textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 7, 100, 30)];
        textField.tag = 1;
        [cell.contentView addSubview:textField];
        [textField release];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 90, 30)];
        label.tag = 2;
        [cell.contentView addSubview:label];
        [label release];
    } else {
        textField = [cell.contentView viewWithTag:1];
        label = [cell.contentView viewWithTag:2];
    }
    textField.placeholder = @"输入年龄";
    label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
