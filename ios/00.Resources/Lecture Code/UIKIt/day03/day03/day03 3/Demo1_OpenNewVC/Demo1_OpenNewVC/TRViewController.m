//
//  TRViewController.m
//  Demo1_OpenNewVC
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

- (IBAction)tap:(id)sender {
    TRSecondViewController * secondViewController =
    [[[TRSecondViewController alloc] initWithNibName:@"TRSecondViewController" bundle:nil] autorelease];
    
    secondViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:secondViewController
                       animated:YES
                     completion:nil];
}

@end













