//
//  TRContactsViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactsViewController.h"
#import "TRContact.h"
#import "TRContactViewController.h"
#import "TRNewContactViewController.h"
@interface TRContactsViewController ()<TRContactDelegate>

@end

@implementation TRContactsViewController
-(void)addNewContact:(TRContact *)cotact didSelectName:(NSString *)name didSelectAge:(int)age didSelectPhone:(NSString *)phoneNumber{
  [self.contactsData addObject:cotact];
  NSIndexPath* newIndex = [NSIndexPath indexPathForRow:[self.contactsData count]-1 inSection:0];
    
   [self.tableView insertRowsAtIndexPaths:@[newIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
 [self.tableView reloadData];
 
}
//-(NSMutableArray*)contactsPerson{
//    [self.contactsPerson addObject:self.contactsData];
//    return self.contactsPerson;
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
   self.title = @"联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(jumpToAdd:)];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
}
-(void)jumpToAdd:(UIButton*)btn{
    TRNewContactViewController* newContractController =[[TRNewContactViewController alloc]initWithNibName:@"TRNewContactViewController" bundle:nil];
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:newContractController];
    newContractController.delegate = self;
    [self presentViewController:navigationController animated:nil completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [self.contactsData count];
}
//某区某行显示什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    TRContact * contact = self.contactsData[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Configure the cell...
    return cell;
}
    /*
     1. 创建TRContact
     2. 在AppDelegate里构建contactsData消息创建模拟数据
     3. 在TRContactsViewController里增加NSArray用于保存联系人数据
     4. 在AppDelegate内给TRContactsViewController的数据赋值
     5. 回答TRContactsViewController的datasource问题(三个)
     
     */
    
    
  


// Override to support conditional editing of the table view.
//询问每行是否进入编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.row ==0) {
        return NO;
    }
    return YES;
}
//询问编辑模式的样式
-(UITableViewCellEditingStyle*)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.contactsData removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
     
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     TRContactViewController *detailViewController = [[TRContactViewController alloc] initWithNibName:@"TRContactViewController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    detailViewController.contact = self.contactsData[indexPath.row];
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

@end
