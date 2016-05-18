//
//  TRContactEditingViewController.h
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRGroup.h"

@interface TRContactEditingViewController : UITableViewController

@property (strong, nonatomic) TRGroup * group;

- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@end
