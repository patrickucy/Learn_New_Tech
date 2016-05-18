//
//  TREditingViewController.h
//  Demo2_TableView
//
//  Created by lingling on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRContact.h"
@interface TREditingViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *ageTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneTextField;
@property(nonatomic,retain)TRContact* contact;
@end
