//
//  TRViewController.m
//  Demo2_MutipleViewController
//
//  Created by apple on 13-6-4.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRSecondViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapA:(id)sender {
    TRSecondViewController * secondViewController =
    [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    //错的！！！！！！不能管理别的controller的view
    //secondViewController.label.text = @"A型血";
    
    secondViewController.bloodDescription =
        @"A型血的人心地善良，为人纯朴";
    
    [self presentViewController:secondViewController animated:YES completion:nil];
}

- (IBAction)tapB:(id)sender {
    TRSecondViewController * secondViewController =
    [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    //错的！！！！！！不能管理别的controller的view
    //secondViewController.label.text = @"A型血";
    
    secondViewController.bloodDescription =
    @"B型血的人 生来命残 夏天招蚊子";
    
    [self presentViewController:secondViewController animated:YES completion:nil];
}
@end










