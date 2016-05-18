//
//  TRBloodTypeChooseViewController.h
//  Demo3_Delegation
//
//  Created by apple on 13-6-4.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TRBloodTypeChooseViewController;

@protocol TRBloodTypeChooseDelegate <NSObject>
- (void)bloodTypeChooseViewController:(TRBloodTypeChooseViewController *) bloodTypeChooseViewController
                   didSelectBloodType:(NSString *) bloodType;

@end

@interface TRBloodTypeChooseViewController : UIViewController

@property (assign, nonatomic) id<TRBloodTypeChooseDelegate> delegate;

- (IBAction)tapA:(id)sender;
- (IBAction)tapB:(id)sender;
- (IBAction)tapAB:(id)sender;
- (IBAction)tapO:(id)sender;

- (IBAction)tap:(UIButton *)sender;
@end


