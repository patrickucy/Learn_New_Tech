//
//  TRViewController.m
//  Demo1_GR_Tap
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
    //1.构建
    UITapGestureRecognizer * tapRestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //2.调整
    tapRestureRecognizer.numberOfTapsRequired = 1;
        //按几下
    tapRestureRecognizer.numberOfTouchesRequired = 2;
        //几只手指头
    //3.加入
    [self.myView addGestureRecognizer:tapRestureRecognizer];
}

- (void)tap:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
