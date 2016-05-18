//
//  TRContactEditingViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactEditingViewController.h"

@interface TRContactEditingViewController ()

@end

@implementation TRContactEditingViewController

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
    self.title = @"编辑联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)done:(id)sender
{
    self.contact.name = self.nameTextField.text;
    self.contact.age = [self.ageTextField.text intValue];
    self.contact.phoneNumber = self.phoneNumberTextField.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    self.nameTextField.text = self.contact.name;
    self.ageTextField.text = [NSString stringWithFormat:@"%d", self.contact.age];
    self.phoneNumberTextField.text = self.contact.phoneNumber;
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
