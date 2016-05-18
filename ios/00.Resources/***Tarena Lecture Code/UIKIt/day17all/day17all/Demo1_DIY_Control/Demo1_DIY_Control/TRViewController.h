//
//  TRViewController.h
//  Demo1_DIY_Control
//
//  Created by apple on 13-6-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRLoopButton.h"

@interface TRViewController : UIViewController

- (IBAction)tap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet TRLoopButton *loopButton;
- (IBAction)tap2:(TRLoopButton *)sender;

@end
