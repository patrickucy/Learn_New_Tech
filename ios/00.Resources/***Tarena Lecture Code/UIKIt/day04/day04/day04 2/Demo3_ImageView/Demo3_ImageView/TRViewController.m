//
//  TRViewController.m
//  Demo3_ImageView
//
//  Created by apple on 13-6-6.
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
    
    //1. 构建跟图片大小一样的UIImageView 
    /*
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Galaxy.jpg"]];
    NSLog(@"%f, %f", imageView.frame.size.width, imageView.frame.size.height);
    [self.view addSubview:imageView];
     */
    
    //2. 构建自定义大小的UIImageView
    /*
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"Galaxy.jpg"];
    //Galaxy@2x.jpg
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
     */
    CGRect frame = self.view.frame;
    frame.origin.x = 10;
    frame.origin.y = 10;
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:frame];
    UIImageView * imageView =
    [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Galaxy.jpg"]];
    [scrollView addSubview:imageView];
    CGRect frameOfImageView = imageView.frame;
    frameOfImageView.origin.x = 10;
    imageView.frame = frameOfImageView;
    CGSize size = imageView.frame.size;
    size.width += 20;
    size.height += 20;
    scrollView.contentSize = size;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
