//
//  TRViewController.m
//  Demo4
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.messageView.message = @"lalalalalallsdasdassagdhasjdghjasdsadasdasdashdkashdjkashdjkashdjkashdjkashdjkahsdjkahdjkahsdjkahsdjkhasjdhajskhdjkashdjkashdjkahdjkagjashdghajga";
    [self.messageView setNeedsDisplay];
    //上面这行代码应该写在view内;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
