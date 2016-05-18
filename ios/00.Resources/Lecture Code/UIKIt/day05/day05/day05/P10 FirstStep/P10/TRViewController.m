//
//  TRViewController.m
//  P10
//
//  Created by apple on 13-6-7.
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
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    for(int i = 0 ; i < [self.picturesData count] ; i++){
        //设置frame
        CGRect frame = scrollView.frame;
        frame.origin = CGPointMake(i * scrollView.frame.size.width, 0);
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
        
        //设置image数据
        imageView.image = [UIImage imageNamed:self.picturesData[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:imageView];
        [imageView release];
    }
    
    CGSize size = scrollView.frame.size;
    size.width *= [self.picturesData count];
    scrollView.contentSize = size;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [_picturesData release];
    [super dealloc];
}
@end
