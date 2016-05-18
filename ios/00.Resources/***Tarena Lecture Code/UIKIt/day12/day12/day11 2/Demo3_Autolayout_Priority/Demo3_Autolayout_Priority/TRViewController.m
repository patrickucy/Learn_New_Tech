//
//  TRViewController.m
//  Demo3_Autolayout_Priority
//
//  Created by apple on 13-6-19.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.button3 setTitle:@"lalalalalalalalalalalalalalalalalalallalala" forState:UIControlStateNormal];
    
    [self.button1 setTitle:@"long long long ago" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
