//
//  TRImageViewController.m
//  P10
//
//  Created by apple on 13-6-7.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRImageViewController.h"

@interface TRImageViewController ()<UIScrollViewDelegate>

@property (retain, nonatomic) UIImageView * imageView;

@end

@implementation TRImageViewController

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

- (void)viewWillAppear:(BOOL)animated{
    CGRect frame = self.view.frame;
    frame.origin = CGPointZero;
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.delegate = self;
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:self.image];
    self.imageView = imageView;
    
    scrollView.contentSize = imageView.frame.size;
    scrollView.minimumZoomScale =
    scrollView.frame.size.width / imageView.frame.size.width;
    scrollView.maximumZoomScale = 1.0;
    scrollView.zoomScale = scrollView.frame.size.width / imageView.frame.size.width;
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    [super viewWillAppear:animated];
    
    [imageView release];
    [scrollView release];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
@end
