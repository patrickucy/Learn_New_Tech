//
//  TRViewController.m
//  Demo3_GR_Rotation
//
//  Created by apple on 13-6-17.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@property (strong, nonatomic) UIImageView * imageView;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Elephant.jpg"]];
    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI * 30.0 / 180.0);
//    self.imageView.transform = transform;
    
    UIRotationGestureRecognizer * rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
    
    [self.view addSubview:self.imageView];
}

- (void)rotate:(UIRotationGestureRecognizer *) rotationGestureRecognizer{
    CGAffineTransform transform = CGAffineTransformRotate(self.imageView.transform, rotationGestureRecognizer.rotation);
    self.imageView.transform = transform;
    rotationGestureRecognizer.rotation = 0.0;    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
