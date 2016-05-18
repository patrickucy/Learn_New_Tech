//
//  TRViewController.m
//  Demo3_Delegation
//
//  Created by apple on 13-6-4.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRBloodTypeChooseViewController.h"

@interface TRViewController () <TRBloodTypeChooseDelegate>

@end

@implementation TRViewController

- (void)bloodTypeChooseViewController:(TRBloodTypeChooseViewController *)bloodTypeChooseViewController
                   didSelectBloodType:(NSString *)bloodType{
    
    [self.button setTitle:bloodType forState:UIControlStateNormal];
    
}

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

- (IBAction)chooseBlood:(id)sender {
    TRBloodTypeChooseViewController * bloodTypeChooseViewController = [[[TRBloodTypeChooseViewController alloc] initWithNibName:@"TRBloodTypeChooseViewController" bundle:nil] autorelease];
    bloodTypeChooseViewController.delegate = self;
    [self presentViewController:bloodTypeChooseViewController
                       animated:YES
                     completion:nil];
}
- (void)dealloc {
    [_button release];
    [super dealloc];
}
@end








