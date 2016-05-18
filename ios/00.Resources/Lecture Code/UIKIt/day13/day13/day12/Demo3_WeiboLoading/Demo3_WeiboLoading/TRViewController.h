//
//  TRViewController.h
//  Demo3_WeiboLoading
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRWeiboLoadingView.h"

@interface TRViewController : UIViewController

- (IBAction)change:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet TRWeiboLoadingView *loadingView;


@end
