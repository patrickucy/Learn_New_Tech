//
//  TRViewController.m
//  Demo1_Autolayout_Code
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
    [button setTitle:@"Autolayout" forState:UIControlStateNormal];
    
    //1.关掉Autoresizing向Autolayout的自动翻译 避免约束冲突
    self.view.translatesAutoresizingMaskIntoConstraints = NO;\
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    //2.根据公式构建约束
    //view1.attr1 = view2.attr2 * multiplier + constant
    //button.left = self.view.left * 1 + 10;
    //1----- 2--- 3 4-------- 5---   6   7-
    id leftMargin =
    [NSLayoutConstraint constraintWithItem:button
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:10.0];
    //view1.attr1 = view2.attr2 * multiplier + constant
    //button.top = self.view.top * 1 + 10;
    id topMargin =
    [NSLayoutConstraint constraintWithItem:button
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:10.0];
    
    //3.  将约束加到合适的视图内
    [self.view addConstraints:@[leftMargin, topMargin]];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
