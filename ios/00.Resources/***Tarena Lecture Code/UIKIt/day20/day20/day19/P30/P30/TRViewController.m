//
//  TRViewController.m
//  P30
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#define CURRENT_DATABASE_VERSION 3

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSUserDefaults * userDefaults =
        [NSUserDefaults standardUserDefaults];
    
    NSInteger databaseVersion = [userDefaults integerForKey:@"database version"];
    if (databaseVersion == 2 && CURRENT_DATABASE_VERSION == 3) {
        [self migrationDatabaseStructorFrom2To3];
    }
    
    BOOL didLaunch = [userDefaults boolForKey:@"didLaunch"];
    if(didLaunch){
        //跳B
        UIViewController * viewController =
            [self.storyboard
             instantiateViewControllerWithIdentifier:
             @"B View Controller"];
        [self presentViewController:viewController
                           animated:NO
                         completion:nil];
    } else {
        //跳A
        UIViewController * viewController =
        [self.storyboard
         instantiateViewControllerWithIdentifier:
         @"A View Controller"];
        [self presentViewController:viewController
                           animated:NO
                         completion:nil];
        //改值
        [userDefaults setBool:YES forKey:@"didLaunch"];
        [userDefaults synchronize];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)migrationDatabaseStructorFrom2To3
{
    ///可能有耗时操作
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
