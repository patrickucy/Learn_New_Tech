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
    
    NSDictionary*users=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"users" ofType:@"plist"]];
    NSArray*allUsers=users.allKeys;
    self.label.text = [NSString stringWithFormat:@"%@:%@", usernameString, passwordString];
    for (NSString*user in allUsers) {
        if ([user isEqualToString:usernameString]) {
            NSString*passWord=[users objectForKey:user];
            if ([passWord isEqualToString:passwordString]) {
                UIAlertView * alertView =
                [[UIAlertView alloc] initWithTitle:@"登陆"
                                           message:@"登陆成功"
                                          delegate:self
                                 cancelButtonTitle:@"好的"
                                 otherButtonTitles:nil];
                [alertView show];
                return;
            }
        }
    }
    UIAlertView * alertView =
    [[UIAlertView alloc] initWithTitle:@"登陆"
                               message:@"登陆失败"
                              delegate:self
                     cancelButtonTitle:@"返回"
                     otherButtonTitles:@"重新输入", nil];
    
    [alertView show];

    
    
    
//    self.label.text = [NSString stringWithFormat:@"%@:%@", usernameString, passwordString];
//    
//    if ([self.appModel checkUsername:usernameString
//                        withPassword:passwordString]) {
//        UIAlertView * alertView =
//        [[UIAlertView alloc] initWithTitle:@"登陆"
//                                   message:@"登陆成功"
//                                  delegate:self
//                         cancelButtonTitle:@"好的"
//                         otherButtonTitles:nil];
//        [alertView show];
//    } else {
//        UIAlertView * alertView =
//        [[UIAlertView alloc] initWithTitle:@"登陆"
//                                   message:@"登陆失败"
//                                  delegate:self
//                         cancelButtonTitle:@"返回"
//                         otherButtonTitles:@"重新输入", nil];
//    
//        [alertView show];
//    }
    
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

- (IBAction)regist:(UIButton *)sender {
    NSString * usernameString = self.usernameTextField.text;
    NSString * passwordString = self.passwordTextField.text;
    
    NSMutableDictionary*users=[NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"users" ofType:@"plist"]];
    [users setObject:passwordString forKey:usernameString];
    [users writeToFile:[[NSBundle mainBundle]pathForResource:@"users" ofType:@"plist"] atomically:YES];
}
@end
