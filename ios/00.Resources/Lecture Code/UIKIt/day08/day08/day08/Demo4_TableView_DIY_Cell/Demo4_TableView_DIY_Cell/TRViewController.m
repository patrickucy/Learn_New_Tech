//
//  TRViewController.m
//  Demo4_TableView_DIY_Cell
//
//  Created by apple on 13-6-13.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /// 补充的创建tableview的第三种方式（纯代码）
    //1. 构建
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    //2.调整
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //3.加入
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        //配置Cell界面
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UISwitch * toggleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        [toggleSwitch addTarget:self action:@selector(toggle:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = toggleSwitch;
        [toggleSwitch release];
    }
    //更新cell消息
    cell.textLabel.text = @"test";
    return cell;
}
- (void) toggle:(id)sender{
    
}

@end
