//
//  TRViewController.m
//  P10
//
//  Created by apple on 13-6-7.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRImageViewController.h"

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
        
        TRImageViewController * imageViewController =
        [[TRImageViewController alloc] initWithNibName:@"TRImageViewController" bundle:nil];
        imageViewController.view.frame = frame;
        
        //设置image数据
        imageViewController.image = [UIImage imageNamed:self.picturesData[i]];
        [scrollView addSubview:imageViewController.view];
        //内存bug imageViewController没有释放
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
