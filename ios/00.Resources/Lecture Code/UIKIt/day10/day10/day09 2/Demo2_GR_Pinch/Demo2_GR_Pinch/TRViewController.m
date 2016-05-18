//
//  TRViewController.m
//  Demo2_GR_Pinch
//
//  Created by apple on 13-6-17.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    
    [self.view addGestureRecognizer:pinchGestureRecognizer];
}

- (void)pinch:(UIPinchGestureRecognizer *) pinchGestureRecognizer
{
    CGFloat scale = pinchGestureRecognizer.scale;
    if (scale < 0.7){
        //
    } else if (scale > 1.3){
        //
    }
    
    NSLog(@"%.2f", scale);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
