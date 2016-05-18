//
//  TRViewController.m
//  Demo1_TableView_ViewCell
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMessageCell1.h"

@interface TRViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[TRMessageCell1 class] forCellReuseIdentifier:@"Message Cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRMessageCell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"Message Cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray * messages = @[
    @"你好",
    @"在么？",
    @"你怎么不说话啊",
    @"你到底在不在，我找你有急事，再不接电话，我就报警了，我说真的，真心的，快点接，少废话。",
    @"对不起，您的电话已欠费，请速拨打电话：13800138000"
    ];
    cell.message = messages[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRMessageCell1 * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}




@end
