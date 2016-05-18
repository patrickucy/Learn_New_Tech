//
//  TRCViewController.m
//  Demo2_Singleton
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRCViewController.h"
#import "TRSingleton.h"

@interface TRCViewController ()

@end

@implementation TRCViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    TRSingleton * singleton = [TRSingleton sharedSingleton];
    NSLog(@"%d", singleton.count);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
