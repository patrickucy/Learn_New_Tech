//
//  TRViewController.m
//  P01
//
//  Created by apple on 13-5-31.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@property (assign, nonatomic) NSUInteger labelCount;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelCount = 0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
//    static int labelStartY
    //1.
//    self.labelCount += 1;
    self.labelCount = self.labelCount+1;
    CGRect frame = CGRectMake(10, 100 + (self.labelCount - 1)*40, 300, 30);
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    
    //2.
    label.text = [NSString stringWithFormat:@"%u", self.labelCount];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    
    //3.
    [self.view addSubview:label];
    
    //4.
    [label release];
}

@end















