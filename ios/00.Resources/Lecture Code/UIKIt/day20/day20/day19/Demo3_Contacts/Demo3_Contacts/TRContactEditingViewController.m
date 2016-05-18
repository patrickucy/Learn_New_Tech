//
//  TRContactEditingViewController.m
//  Demo3_Contacts
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactEditingViewController.h"

#import "TRContact.h"
#import "TRAppModel.h"

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
    
    //1. 创建对象
    TRContact * contact = [[TRContact alloc] init];
    contact.name        = self.nameTextField.text;
    contact.age         = self.ageTextField.text;
    contact.phoneNumber = self.phoneNumberTextField.text;
    
    //2. 加入共享数据
    TRAppModel * appModel = [TRAppModel sharedAppModel];
    [appModel.contacts addObject:contact];
    
    //
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)cancel:(id)sender {
}
@end
