//
//  TRViewController.m
//  Demo1_User_Default
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults * userDefaults =
        [NSUserDefaults standardUserDefaults];
    BOOL didLaunch =
        [userDefaults boolForKey:@"didLaunchBefore"];
    if(!didLaunch){
        
        //代码只被运行一次（应用程序第一次运行的时候）
        
        [userDefaults setBool:YES forKey:@"didLaunchBefore"];
        [userDefaults synchronize];
    }
    
    //1.拿值
    NSInteger times =
        [userDefaults integerForKey:@"launch times"];
    //2.改值
    times ++;
    //3.存值
    //int i = 1;
    //int a = ++i / i++;
    //a = 2, i = 2 / a = 1, i = 2
    [userDefaults setInteger:times forKey:@"launch times"];
    [userDefaults synchronize];
    
    
    NSLog(@"%d", times);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
