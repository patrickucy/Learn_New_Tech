//
//  TRAddContactViewController.h
//  Demo2_TableView
//
//  Created by apple on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRContact.h"

@class TRAddContactViewController;

@protocol TRAddContactDelegate <NSObject>

- (void) addContactViewController:(TRAddContactViewController *) addContactViewController didCreateContact:(TRContact * ) contact;

@end

@interface TRAddContactViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *nameTextField;

@property (retain, nonatomic) IBOutlet UITextField *ageTextField;

@property (retain, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (assign, nonatomic) id<TRAddContactDelegate> delegate;


@end
