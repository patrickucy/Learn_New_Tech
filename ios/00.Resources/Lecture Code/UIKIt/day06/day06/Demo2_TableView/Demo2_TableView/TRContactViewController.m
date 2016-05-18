//
//  TRContactViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactViewController.h"

#import "TRContactEditingViewController.h"

@interface TRContactViewController ()

@end

@implementation TRContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(beginEditing:)];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = self.contact.name;
    [self.tableView reloadData];
}

- (void)beginEditing:(id)sender{
    TRContactEditingViewController * contactEditingViewController = [[TRContactEditingViewController alloc] initWithNibName:@"TRContactEditingViewController" bundle:nil];
    
    contactEditingViewController.contact = self.contact;
    
    UINavigationController * navigationController =
    [[UINavigationController alloc] initWithRootViewController:contactEditingViewController];
    
    [contactEditingViewController release];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    [navigationController release];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"姓名";
        cell.detailTextLabel.text = self.contact.name;
    } else if(indexPath.row == 1){
        cell.textLabel.text = @"年龄";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.contact.age];
        NSLog(@"%@",cell.textLabel.text);
    } else if(indexPath.row == 2){
        cell.textLabel.text = @"电话";
        cell.detailTextLabel.text = self.contact.phoneNumber;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



















@end
