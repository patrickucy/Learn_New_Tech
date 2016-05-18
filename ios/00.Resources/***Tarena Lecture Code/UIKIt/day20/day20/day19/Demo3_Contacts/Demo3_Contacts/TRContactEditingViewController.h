//
//  TRContactEditingViewController.h
//  Demo3_Contacts
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRContact.h"

@interface TRContactEditingViewController : UITableViewController

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (strong, nonatomic) TRContact * contact;
@property (nonatomic) BOOL isAddingMode;

@end
