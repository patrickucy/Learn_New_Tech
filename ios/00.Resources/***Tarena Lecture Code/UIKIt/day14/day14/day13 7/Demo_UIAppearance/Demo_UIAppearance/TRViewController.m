//
//  TRViewController.m
//  Demo_UIAppearance
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.slider1.minimumTrackTintColor = [UIColor redColor];
//    self.slider2.minimumTrackTintColor = [UIColor redColor];
//    self.slider3.minimumTrackTintColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    TRViewController * vc = [[TRViewController alloc] initWithNibName:@"TRViewController" bundle:nil];
    UINavigationController * n = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:n animated:YES completion:nil];
    
}
@end
