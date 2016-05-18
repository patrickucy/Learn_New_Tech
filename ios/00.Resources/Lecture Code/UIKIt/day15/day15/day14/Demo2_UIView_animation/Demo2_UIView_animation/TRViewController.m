//
//  TRViewController.m
//  Demo2_UIView_animation
//
//  Created by apple on 13-6-24.
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
- (void)viewWillAppear:(BOOL)animated
{
//    [UIView animateWithDuration:1.0 animations:^{
//        self.label.alpha = 0;
//        CGPoint center = self.label.center;
//        center.y += 20;
//        self.label.center = center;
//    }];
//    [UIView animateWithDuration:1.0
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse |
//     UIViewAnimationOptionRepeat
//                     animations:^{
//                         CGPoint center = self.label.center;
//                         center.x += 200;
//                         center.y += 200;
//                         self.label.center = center;
//                     }
//                     completion:nil];
    self.label.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 1;
    tapGR.numberOfTouchesRequired = 1;
    [self.label addGestureRecognizer:tapGR];
}
- (void)tap:(UITapGestureRecognizer *)tapGR
{
    [UIView animateWithDuration:1.0 animations:^{
        self.label.alpha = 0.0;
    } completion:^(BOOL finished){
        [self.label removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
