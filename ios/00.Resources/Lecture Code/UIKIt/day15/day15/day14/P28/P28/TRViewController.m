//
//  TRViewController.m
//  P28
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
    self.imageView.userInteractionEnabled = YES;
	UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 1;
    tapGR.numberOfTouchesRequired = 1;
    [self.imageView addGestureRecognizer:tapGR];
    
}

- (void)tap:(UITapGestureRecognizer *)tapGR
{
    UIImageView * animatedImageView = [[UIImageView alloc] init];
    animatedImageView.frame = self.imageView.frame;
    animatedImageView.image = self.imageView.image;
    [self.view addSubview:animatedImageView];
    //起始状态写在动画外
    [UIView animateWithDuration:1.0 delay:0.0
    options:UIViewAnimationOptionCurveEaseIn animations:^{
                         //终结状态写在动画里
        CGPoint center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height);
        animatedImageView.center = center;
        CGAffineTransform transform = CGAffineTransformRotate(animatedImageView.transform, M_PI_4);
        transform = CGAffineTransformScale(transform, 0.2, 0.2);
        animatedImageView.transform = transform;
    }
                     completion:^(BOOL finished){
        [animatedImageView removeFromSuperview];
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
