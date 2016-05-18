//
//  TRBloodTypeChooseViewController.m
//  Demo3_Delegation
//
//  Created by apple on 13-6-4.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRBloodTypeChooseViewController.h"

@interface TRBloodTypeChooseViewController ()

@end

@implementation TRBloodTypeChooseViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapA:(id)sender {
    [self.delegate bloodTypeChooseViewController:self
                              didSelectBloodType:@"A型血"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapB:(id)sender {
    [self.delegate bloodTypeChooseViewController:self
                              didSelectBloodType:@"B型血"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapAB:(id)sender {
    [self.delegate bloodTypeChooseViewController:self
                              didSelectBloodType:@"AB型血"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapO:(id)sender {
    [self.delegate bloodTypeChooseViewController:self
                              didSelectBloodType:@"O型血"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#define BLOOD_A_TYPE_BUTTON_TAG 1
#define BLOOD_B_TYPE_BUTTON_TAG 2
#define BLOOD_AB_TYPE_BUTTON_TAG 3
#define BLOOD_O_TYPE_BUTTON_TAG 4

- (IBAction)tap:(UIButton *)sender {
    NSInteger tagOfButton = sender.tag;
    NSString * bloodType = nil;
    switch (tagOfButton) {
        case BLOOD_A_TYPE_BUTTON_TAG:
            bloodType = @"A型血";
            break;
        case BLOOD_B_TYPE_BUTTON_TAG:
            bloodType = @"B型血";
            break;
        case BLOOD_AB_TYPE_BUTTON_TAG:
            bloodType = @"AB型血";
            break;
        case BLOOD_O_TYPE_BUTTON_TAG:
            bloodType = @"O型血";
            break;
        default:
            break;
    }
    [self.delegate bloodTypeChooseViewController:self
                              didSelectBloodType:bloodType];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
