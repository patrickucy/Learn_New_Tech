//
//  TREditingViewController.m
//  Demo2_TableView
//
//  Created by lingling on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TREditingViewController.h"
#import "TRContact.h"
@interface TREditingViewController ()

@end

@implementation TREditingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    self.nameTextField.text = self.contact.name;
    self.ageTextField.text = [NSString stringWithFormat:@"%d",self.contact.age];
    self.phoneTextField.text = self.contact.phoneNumber;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"编辑联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(jumpBackContact:)];
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];

    
}
-(void)jumpBackContact:(id)sender{
    self.contact.name= self.nameTextField.text;
    self.contact.age = [self.ageTextField.text intValue];
    self.contact.phoneNumber = self.phoneTextField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameTextField release];
    [_ageTextField release];
    [_phoneTextField release];
    [super dealloc];
}
@end
