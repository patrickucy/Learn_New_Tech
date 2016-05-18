//
//  TRViewController.h
//  Demo_UIAppearance
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UISlider *slider3;
- (IBAction)tap:(id)sender;

@end
