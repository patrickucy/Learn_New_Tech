//
//  TRNewContactViewController.h
//  Demo2_TableView
//
//  Created by lingling on 13-6-9.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TRContact;
@protocol TRContactDelegate <NSObject>

-(void)addNewContact:(TRContact*)cotact didSelectName:(NSString*)name didSelectAge:(int)age didSelectPhone:(NSString*)phoneNumber;

@end@interface TRNewContactViewController : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *ageTextField;
@property (retain, nonatomic) IBOutlet UITextField *phoneTextField;
@property(nonatomic,assign)id <TRContactDelegate>delegate;
@end
