//
//  TRAppDelegate.m
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAppDelegate.h"

#import "TRContactsViewController.h"
#import "TRContact.h"

@implementation TRAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[TRContactsViewController alloc] initWithNibName:@"TRContactsViewController" bundle:nil] autorelease];
    
    self.viewController.contactsData = [[self contactsData] mutableCopy];
    
    UINavigationController * navigationController =
    [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    self.window.rootViewController = navigationController;
    [navigationController release];
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSArray *)contactsData{
    // !! ----- 违规 ----- /
    
    TRContact * user1 =
        [[[TRContact alloc] init] autorelease];
    user1.name = @"user1";
    user1.age = 20;
    user1.phoneNumber = @"13800138000";
    
    TRContact * user2 =
    [[[TRContact alloc] init] autorelease];
    user2.name = @"user2";
    user2.age = 90;
    user2.phoneNumber = @"13800138001";
    
    TRContact * user3 =
    [[[TRContact alloc] init] autorelease];
    user3.name = @"user3";
    user3.age = 5;
    user3.phoneNumber = @"13800139000";
    
    TRContact * user4 =
    [[[TRContact alloc] init] autorelease];
    user4.name = @"user4";
    user4.age = 45;
    user4.phoneNumber = @"13800128000";
    
    return @[user1, user2, user3, user4];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
