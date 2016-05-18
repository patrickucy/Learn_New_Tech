//
//  TRNewContactViewController.m
//  Demo2_TableView
//
//  Created by lingling on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRNewContactViewController.h"
#import "TRContact.h"
@interface TRNewContactViewController ()

@end

@implementation TRNewContactViewController
-(void)viewWillAppear:(BOOL)animated{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新建联系人";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(jumpBackContact:)];
    self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];
    
}
-(void)cancel:(UIButton*)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)jumpBackContact:(UIButton*)button{
    TRContact* newContact = [[TRContact alloc]init];
    newContact.delegate = self;
    newContact.name = self.nameTextField.text;
    newContact.age = self.ageTextField.text;
    newContact.phoneNumber = self.phoneTextField.text;
       [self dismissViewControllerAnimated:YES completion:^{
           //在下面代码是在动画执行之后调动Block.
           [self.delegate addNewContact:newContact didSelectName:newContact.name didSelectAge:newContact.age didSelectPhone:newContact.phoneNumber];

    }];
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
