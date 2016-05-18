//
//  TRContactEditingViewController.m
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactEditingViewController.h"
#import "TRContact.h"
#import "TRAppDelegate.h"

@interface TRContactEditingViewController ()

@end

@implementation TRContactEditingViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)done:(id)sender {
//    [self.storyboard instantiateViewControllerWithIdentifier:@".....ViewController"];
    
    //1. 获取MOC
    TRAppDelegate * appDelegate =
    [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * context =
        appDelegate.managedObjectContext;
    //TRAppModel * appModel = [TRAppModel sharedAppModel];
    
    //2. 创建对象
    TRContact * contact =
    [NSEntityDescription
     insertNewObjectForEntityForName:@"TRContact"
     inManagedObjectContext:context];
    //TRContact * contact = [[TRContact alloc] init];
    //[appModel.contacts addObject:contact];
    
    //3. 修改对象值 
    contact.name = self.nameTextField.text;
    contact.age = @([self.ageTextField.text integerValue]);
    contact.phoneNumber = self.phoneNumberTextField.text;
    
    //
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
