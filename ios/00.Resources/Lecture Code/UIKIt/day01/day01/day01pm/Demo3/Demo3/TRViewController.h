//
//  TRViewController.h
//  Demo3
//
//  Created by apple on 13-5-31.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController
- (IBAction)slide:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UISlider *slider;

@end
