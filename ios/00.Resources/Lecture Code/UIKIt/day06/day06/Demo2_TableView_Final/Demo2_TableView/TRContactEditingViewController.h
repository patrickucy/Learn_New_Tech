//
//  TRContactEditingViewController.h
//  Demo2_TableView
//
//  Created by apple on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRContact.h"

@interface TRContactEditingViewController : UIViewController

@property (retain, nonatomic) TRContact * contact;
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *ageTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end
