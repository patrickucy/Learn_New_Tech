//
//  TRViewController.h
//  P04
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController
- (IBAction)loginTap:(id)sender;
@property (retain, nonatomic) IBOutlet UITextField *usernameTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UILabel *label;
- (IBAction)usernameTextFieldOnExit:(id)sender;
- (IBAction)passwordTextFieldOnExit:(id)sender;

@end
