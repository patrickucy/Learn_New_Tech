//
//  TRLaunchingViewController.m
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRLaunchingViewController.h"
#import "TRGroup.h"
#import "TRAppDelegate.h"

@interface TRLaunchingViewController ()

@end

@implementation TRLaunchingViewController

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
    //1. 获取UserDefault
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    //2. 设计一个键的字符串
    BOOL didInitGroups =
        [userDefaults boolForKey:@"didInitGroups"];
    
    //3. 根据判断 对 Group进行初始化
    if (!didInitGroups) {
        //4. 往 大草原上 扔 羊(此初始化操作只执行一次, 无论之后怎么打开)
        TRAppDelegate * appDelegate =
        [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext * context =
        appDelegate.managedObjectContext;
        
        TRGroup * group = nil;
        group = [NSEntityDescription
                 insertNewObjectForEntityForName:@"TRGroup"
                          inManagedObjectContext:context];
        group.name = @"工作";
        
        
        group = [NSEntityDescription
                 insertNewObjectForEntityForName:@"TRGroup"
                 inManagedObjectContext:context];
        group.name = @"朋友";
        
        group = [NSEntityDescription
                 insertNewObjectForEntityForName:@"TRGroup"
                 inManagedObjectContext:context];
        group.name = @"家庭";
        
        [userDefaults setBool:YES forKey:@"didInitGroups"];
        [userDefaults synchronize];
    }
    //5. 初始化后 跳转到 之前的navi界面
    
    id vc = [self.storyboard
             instantiateViewControllerWithIdentifier:
             @"Root View Controller"];
    [self presentViewController:vc animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
