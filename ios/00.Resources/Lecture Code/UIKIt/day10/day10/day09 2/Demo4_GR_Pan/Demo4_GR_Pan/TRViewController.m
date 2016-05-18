//
//  TRViewController.m
//  Demo4_GR_Pan
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
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    
    [self.childView addGestureRecognizer:panGestureRecognizer];
}

- (void)move:(UIPanGestureRecognizer *)panGestureRecognizer
{
    static CGPoint originalCenter;
    if(panGestureRecognizer.state == UIGestureRecognizerStateBegan){
        originalCenter = self.childView.center;
    } else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [panGestureRecognizer translationInView:self.view];
        CGPoint center = self.childView.center;
        center.x = originalCenter.x + translation.x;
        center.y = originalCenter.y + translation.y;
        self.childView.center = center;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
