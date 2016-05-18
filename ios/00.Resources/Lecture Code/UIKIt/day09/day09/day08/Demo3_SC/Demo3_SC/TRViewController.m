//
//  TRViewController.m
//  Demo3_SC
//
//  Created by apple on 13-6-14.
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

-(void)viewWillAppear:(BOOL)animated{
    NSString *str = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UISegmentedControl *)sender {
    NSInteger index =  sender.selectedSegmentIndex;
    NSLog(@"%d", index);
    NSLog(@"%@", [sender titleForSegmentAtIndex:index]);
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
@end
