//
//  TRViewController.h
//  Demo1_UITextField
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *textField;
@property (retain, nonatomic) IBOutlet UILabel *label;
- (IBAction)tap:(id)sender;

- (IBAction)textFieldOnExit:(id)sender;
- (IBAction)tap2:(id)sender;


@end
