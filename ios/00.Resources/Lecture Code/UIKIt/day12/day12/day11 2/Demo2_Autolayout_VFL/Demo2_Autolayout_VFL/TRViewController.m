//
//  TRViewController.m
//  Demo2_Autolayout_VFL
//
//  Created by apple on 13-6-19.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Visual Format Language" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //1.  关闭autoresize自动翻译
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    //2.  构建约束
    NSDictionary * map = NSDictionaryOfVariableBindings(button);
    NSString * format = @"|-10-[button]-10-|";
    NSArray * constains1 = 
    [NSLayoutConstraint constraintsWithVisualFormat:format
                                            options:0
                                            metrics:nil
                                              views:map];
    //3.  约束加入视图
    [self.view addConstraints:constains1];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[button]" options:0 metrics:nil views:map]];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"Visual Format" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"Language" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    
    //1.
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    
    //2.
    
    NSDictionary * views = NSDictionaryOfVariableBindings(button1,button2);
    NSArray * horizontal =
    [NSLayoutConstraint constraintsWithVisualFormat:
     @"|-10-[button1]-10-[button2(==button1)]-10-|"
                                            options:
     NSLayoutFormatAlignAllCenterY
                                            metrics:nil
                                              views:views];
    
    [self.view addConstraints:horizontal];
    
    NSArray * bottom =
    [NSLayoutConstraint constraintsWithVisualFormat:
     @"V:[button1]-10-|"
                                            options:0
                                            metrics:nil
                                              views:views];
    
    [self.view addConstraints:bottom];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
