//
//  TRViewController.h
//  Demo3_Keyboard
//
//  Created by apple on 13-6-24.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *inputBackground;
@property (weak, nonatomic) IBOutlet UIImageView *textFieldBackground;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *inputView;
- (IBAction)send:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
