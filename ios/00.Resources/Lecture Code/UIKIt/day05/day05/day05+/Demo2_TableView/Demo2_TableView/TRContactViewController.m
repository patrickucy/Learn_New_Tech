//
//  TRContactViewController.m
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContactViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    self.nameLabel.text = self.contact.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", self.contact.age];
    self.phoneNumberLabel.text = self.contact.phoneNumber;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameLabel release];
    [_ageLabel release];
    [_phoneNumberLabel release];
    [super dealloc];
}
@end
