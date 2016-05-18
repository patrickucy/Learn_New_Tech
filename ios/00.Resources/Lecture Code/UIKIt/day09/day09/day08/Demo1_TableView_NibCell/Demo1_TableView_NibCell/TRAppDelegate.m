//
//  TRAppDelegate.m
//  Demo1_TableView_NibCell
//
//  Created by apple on 13-6-14.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAppDelegate.h"
#import "TRSong.h"

#import "TRViewController.h"

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
    self.viewController = [[[TRViewController alloc] initWithNibName:@"TRViewController" bundle:nil] autorelease];
    self.viewController.songs = [self songs];
    self.viewController.currentSongIndex = 2;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSArray *)songs{
    TRSong * s1 = [[[TRSong alloc] init] autorelease];
    s1.title = @"Get Lucky";
    s1.singerName = @"Daft Punk";
    s1.length = @"04:07";
    
    TRSong * s2 = [[[TRSong alloc] init] autorelease];
    s2.title = @"Who's That Chick";
    s2.singerName = @"David Guetta";
    s2.length = @"02:47";
    
    TRSong * s3 = [[[TRSong alloc] init] autorelease];
    s3.title = @"Mozart's House";
    s3.singerName = @"AlunaGeorge";
    s3.length = @"03:08";
    
    TRSong * s4 = [[[TRSong alloc] init] autorelease];
    s4.title = @"Clarity";
    s4.singerName = @"Zedd";
    s4.length = @"04:31";
    
    return @[s1,s2,s3,s4];
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
