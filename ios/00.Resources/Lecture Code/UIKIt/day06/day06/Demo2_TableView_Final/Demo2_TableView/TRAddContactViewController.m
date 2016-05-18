//
//  TRAddContactViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAddContactViewController.h"
#import "TRContact.h"

@interface TRAddContactViewController ()

@end

@implementation TRAddContactViewController

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel:)];
    self.title = @"新建联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
    
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)done:(id)sender
{
    TRContact * contact = [[TRContact alloc] init];
    contact.name = self.nameTextField.text;
    contact.age = [self.ageTextField.text intValue];
    contact.phoneNumber = self.phoneNumberTextField.text;

    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate addContactViewController:self didCreateContact:contact];
    }];
    [contact release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameTextField release];
    [_ageTextField release];
    [_phoneNumberTextField release];
    [super dealloc];
}
@end
