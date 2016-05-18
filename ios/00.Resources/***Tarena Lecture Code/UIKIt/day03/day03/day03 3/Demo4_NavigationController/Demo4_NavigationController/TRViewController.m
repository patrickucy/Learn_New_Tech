//
//  TRViewController.m
//  Demo4_NavigationController
//
//  Created by apple on 13-6-4.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRViewControllerB.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"A";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    TRViewControllerB * viewControllerB =
    [[TRViewControllerB alloc] initWithNibName:@"TRViewControllerB" bundle:nil];
    
    [self.navigationController pushViewController:viewControllerB animated:YES];
    
    [viewControllerB release];
}
@end















