//
//  TRContactViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactViewController.h"
#import "TREditingViewController.h"
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
-(void)viewWillAppear:(BOOL)animated{
    self.title = self.contact.name;
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleBordered target:self action:@selector(editButtonItem:)];
}
//-(void)viewWillAppear:(BOOL)animated{
    //self.nameLabel.text = self.contact.name;
//    self.ageLabel.text = [NSString stringWithFormat:@"%d", self.contact.age];
//    self.phoneNumberLabel.text = self.contact.phoneNumber;
//}

-(void)editButtonItem:(id)sender{
    TREditingViewController* editingController = [[TREditingViewController alloc]initWithNibName:@"TREditingViewController" bundle:nil];
    //指针赋值
    editingController.contact = self.contact;
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:editingController];
    [self presentViewController:navigationController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewWillAppear:(BOOL)animated{
//    self.title = self.contact.name;
//}
- (void)dealloc {
    [_tableView release];
        [super dealloc];
}
#pragma mark - Table view data source
// 有几个区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//每个区里有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}
//某区某行显示什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        cell.textLabel.text = @"text";
        cell.detailTextLabel.text = @"detail";
       // 如果indexPath是第一行
        if (indexPath.row==0) {
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text= self.contact.name;
        }else if (indexPath.row==1){
            cell.textLabel.text = @"年龄";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",self.contact.age];
        }else{
            cell.textLabel.text = @"电话";
            cell.detailTextLabel.text = self.contact.phoneNumber;
        }
            
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
            }
          return cell;
}

@end
