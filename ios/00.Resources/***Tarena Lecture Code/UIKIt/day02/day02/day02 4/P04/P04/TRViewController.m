//
//  TRViewController.m
//  P04
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//  WWDC World-wide Developer Conference

#import "TRViewController.h"

@interface TRViewController () <UIAlertViewDelegate>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginTap:(id)sender {
    [self becomeFirstResponder];
    NSString * usernameString = self.usernameTextField.text;
    NSString * passwordString = self.passwordTextField.text;
    self.label.text = [NSString stringWithFormat:@"%@:%@", usernameString, passwordString];
    
    UIAlertView * alertView =
        [[UIAlertView alloc] initWithTitle:@"登陆"
                                   message:@"登陆失败"
                                  delegate:self
                         cancelButtonTitle:@"返回"
                         otherButtonTitles:@"重新输入", nil];
    
    [alertView show];
    
}
#define ALERT_BUTTON_INDEX_RETYPE 1

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == ALERT_BUTTON_INDEX_RETYPE){
        self.passwordTextField.text = @"";
        [self.passwordTextField becomeFirstResponder];
    }
}

- (void)dealloc {
    [_usernameTextField release];
    [_passwordTextField release];
    [_label release];
    [super dealloc];
}
- (IBAction)usernameTextFieldOnExit:(id)sender {
    [self.passwordTextField becomeFirstResponder];
}

- (IBAction)passwordTextFieldOnExit:(id)sender {
    [self.passwordTextField resignFirstResponder];
}
@end
