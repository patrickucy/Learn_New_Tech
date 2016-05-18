//
//  TRContactsViewController.m
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactsViewController.h"
#import "TRAppDelegate.h"
#import "TRContact.h"
#import "TRContactEditingViewController.h"

@interface TRContactsViewController ()

@property (nonatomic, strong) NSMutableArray * contacts;

@end

@implementation TRContactsViewController

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
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    //1. 获取MOC
    TRAppDelegate * appDelegate =
        [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * context =
        appDelegate.managedObjectContext;
    //TRAppModel * appModel = [TRAppModel sharedAppModel];
    
    //2. 创建抓数据请求
    NSFetchRequest * request =
    [NSFetchRequest fetchRequestWithEntityName:@"TRContact"];
    //上面的这个TRContact名字 不是类名
    
    //2.1 增加排序描述
    request.sortDescriptors =
    @[
    [NSSortDescriptor sortDescriptorWithKey:@"name"
                                  ascending:YES],
    ];
    
    //2.2 增加筛选
//    request.predicate =
//    [NSPredicate predicateWithFormat:@"age <= %@", @50];
    
//    request.predicate =
//    [NSPredicate predicateWithFormat:
//        @"phoneNumber like %@", @"186*"];
    
    request.predicate =
        [NSPredicate predicateWithFormat:@"group.name == %@",
         self.group.name];
    
    
    
    //3. 获取数据
    NSError * error = nil;
    self.contacts =
    [[context executeFetchRequest:request
                            error:&error] mutableCopy];
    //appModel.contacts
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TRContact * contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        TRContact * contact = self.contacts[indexPath.row];
        
        //把 对象 从Core Data中 删除
        //1. 获取MOC
        TRAppDelegate * appDelegate =
        [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext * context =
        appDelegate.managedObjectContext;
        
        //2. 从MOC中删除
        [context deleteObject:contact];
        
        //把 对象 从 ViewController数据数组中 删除
        [self.contacts removeObject:contact];
        
        //把 显示的Cell 从 tableview 上 删除
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:
         @"Add Contact Segue"]) {
        
        TRContactEditingViewController * editingViewController
            = [segue.destinationViewController topViewController];
        
        editingViewController.group = self.group;
    }
}
@end
