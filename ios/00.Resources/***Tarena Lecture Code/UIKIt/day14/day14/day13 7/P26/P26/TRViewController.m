//
//  TRViewController.m
//  P26
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messageView.message = @"这是一段中文，仅仅是为了测试我写的短信消息绘制是不是可以正常使用。谢谢合作.dddd";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
