//
//  TRViewController.m
//  Demo1_BarButtonItem
//
//  Created by apple on 13-6-6.
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
    self.title = @"Title";
    
    //  1. 设置一个右边的BarButtonItem
    
    /*
    self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)] autorelease];
     */
    
    //  2. 设置多个右边的BarButtonItem
    /*
    self.navigationItem.rightBarButtonItems =
    @[
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil] autorelease]
    ,
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil] autorelease]
    ];
     */
    
    //  3. 设置带FlexibleSpace的多个toolbar按钮(两侧各一个)
    /*
    self.toolbarItems =
    @[
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil] autorelease]
    ,
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease]
    ,
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil] autorelease]
    ];
    self.navigationController.toolbarHidden = NO;
     */
    
    //  4.FixedSpace
    /*
    UIBarButtonItem * fixedItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil] autorelease];
    fixedItem.width = 80;
    
    self.toolbarItems =
    @[
    fixedItem,
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil] autorelease]
    ];
    self.navigationController.toolbarHidden = NO;
     */
    
    //  5. 自定义标题的BarButtonItem
    self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    
    // P08
    UIBarButtonItem * rewindItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:nil action:nil] autorelease];
    
    UIBarButtonItem * playItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil] autorelease];
    
    UIBarButtonItem * fastForwardItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:nil action:nil] autorelease];
    
    self.toolbarItems =
    @[
        rewindItem,
        [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease],
        playItem,
        [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease],
        fastForwardItem
    ];
    self.navigationController.toolbarHidden = NO;
    
}

- (void) add:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
