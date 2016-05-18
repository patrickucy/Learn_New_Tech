//
//  TRViewController.h
//  P07
//
//  Created by apple on 13-6-6.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewController : UIViewController

- (IBAction)next:(id)sender;

@property (assign, nonatomic) NSInteger count;
@property (retain, nonatomic) IBOutlet UILabel *label;


@end
