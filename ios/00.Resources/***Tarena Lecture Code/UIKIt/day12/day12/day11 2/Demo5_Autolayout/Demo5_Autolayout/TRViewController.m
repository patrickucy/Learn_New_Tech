//
//  TRViewController.m
//  Demo5_Autolayout
//
//  Created by apple on 13-6-18.
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
}

- (void)viewWillLayoutSubviews
{
    /*
    int spacing = 10;
    CGFloat boundsWidth = self.view.bounds.size.width;
    CGFloat width = (boundsWidth - 3 * spacing) / 2;
    
    CGRect frame = CGRectZero;
    frame.size = CGSizeMake(width, 40);
    
    frame.origin = CGPointMake(spacing, spacing);
    self.leftButton.frame = frame;
    
    frame.origin.x = frame.origin.x + width + spacing;
    self.rightButton.frame = frame;
    */
    
    [super viewWillLayoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
