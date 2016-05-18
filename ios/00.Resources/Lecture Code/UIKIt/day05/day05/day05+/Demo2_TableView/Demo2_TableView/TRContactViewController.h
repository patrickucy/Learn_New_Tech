//
//  TRContactViewController.h
//  Demo2_TableView
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRContact.h"

@interface TRContactViewController : UIViewController

@property (retain, nonatomic) TRContact * contact;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *ageLabel;
@property (retain, nonatomic) IBOutlet UILabel *phoneNumberLabel;

@end
