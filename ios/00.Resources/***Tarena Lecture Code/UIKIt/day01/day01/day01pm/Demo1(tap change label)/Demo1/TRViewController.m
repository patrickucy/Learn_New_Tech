//
//  TRViewController.m
//  Demo1
//
//  Created by apple on 13-5-31.
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
}

//iOS 6.0 之前 需要释放所有outlet连接的nib上的控件
- (void)viewDidUnload{
    self.label = nil;
    
//    [_label release];
//    _label = label
//    [_label retain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_label release];
    [super dealloc];
}


- (IBAction)tap:(id)sender {
    self.label.text = @"hello world";
}
@end













