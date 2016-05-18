//
//  TRViewController.m
//  Demo4_Zooming
//
//  Created by apple on 13-6-6.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

//步骤3:声明实现delegate
@interface TRViewController () <UIScrollViewDelegate>

@property (retain, nonatomic) UIImageView * imageView;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Galaxy.jpg"]];
    self.imageView = imageView;
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    //frame     CGRect
    //+ origin  CGPoint     xy坐标
    //+ size    CGSize      宽高
    
    // 步骤1:设置最大和最小的放大比例 (可选)
    scrollView.maximumZoomScale = 1.0;
    scrollView.minimumZoomScale =
    scrollView.frame.size.width / imageView.frame.size.width;
    
    // 步骤2:分配 delegate
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
}
//步骤4：实现delegate 返回要放大缩小的view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                       withView:(UIView *)view
                        atScale:(float)scale
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
