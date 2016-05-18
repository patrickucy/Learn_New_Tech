//
//  TRViewController.m
//  Demo1_Touch
//
//  Created by apple on 13-6-18.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray * touchesArray = [touches allObjects];
    NSLog(@"began %u", [touchesArray count]);
    for (UITouch * touch in touchesArray) {
        CGPoint location = [touch locationInView:self.view];
        NSLog(@"%.2f, %.2f", location.x, location.y);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray * touchesArray = [touches allObjects];
    NSLog(@"move %u", [touchesArray count]);
    for (UITouch * touch in touchesArray) {
        CGPoint location = [touch locationInView:self.view];
        NSLog(@"%.2f, %.2f", location.x, location.y);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.multipleTouchEnabled = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
