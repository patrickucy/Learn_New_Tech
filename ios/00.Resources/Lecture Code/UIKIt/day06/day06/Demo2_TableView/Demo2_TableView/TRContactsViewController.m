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
#import "TRAddContactViewController.h"

@interface TRContactsViewController () <TRAddContactDelegate>

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
    self.title = @"联系人";
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(presentAddContact:)];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)presentAddContact:(id)sender
{
    TRAddContactViewController * addContactViewController = [[TRAddContactViewController alloc] initWithNibName:@"TRAddContactViewController" bundle:nil];
    addContactViewController.delegate = self;
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:addContactViewController];
    
    [addContactViewController release];
    
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    [navigationController release];
    
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
// 编辑模式下的第一个问题：要不要进入编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"jjjj");
    return YES;
}
// 第二个问题：你要什么样子的编辑模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.contactsData removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    
     TRContactViewController *detailViewController = [[TRContactViewController alloc] initWithNibName:@"TRContactViewController" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    detailViewController.contact = self.contactsData[indexPath.row];
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

#pragma mark - Add contact delegate

- (void) addContactViewController:(TRAddContactViewController *) addContactViewController didCreateContact:(TRContact * ) contact{
    // 1. tableview 增加数据
    //  1) 增数据
    [self.contactsData addObject:contact];
    NSIndexPath * newIndexPath = [NSIndexPath indexPathForRow:[self.contactsData count] - 1 inSection:0];
    
    //  2) 增行(动画方式) / 更新页面
    //  2.1 增行（局部更新）
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //  2.2 更新页面（整体更新）
//    [self.tableView reloadData];
    //  把TableView最重要的三个问题再问一遍
    //  Model层数据改变 界面需要重新显示（刷新）
    //  Model层是新数据 View层是旧数据
    
    //  reloadData必须发给对应的view
    //  如果当前UI.....ViewController是通过继承UITableViewController实现的
    //  self.tableView 就是 View层的tableview
    
    //  如果当前UI.....ViewController是通过拖拽/代码 创建TV
    //  拖拽 则需要 拉一个property
    //  代码 则需要 提升局部变量生命周期为propery
    //  property可以叫做
    //  @property (retain,nonatomic) UITableView * tableView;
    //  才能 [self.tableView reloadData];
    
}




@end










