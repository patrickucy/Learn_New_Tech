//
//  TRViewController.m
//  Demo1_UITextField
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

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

- (IBAction)tap:(id)sender {
    self.label.text =
    [self.textField.text stringByAppendingString:@", 你好"];
}

- (IBAction)textFieldOnExit:(id)sender {
    [self.textField resignFirstResponder];
//    [self becomeFirstResponder];
}

- (IBAction)tap2:(id)sender {
    [self.textField becomeFirstResponder];
}

- (void)dealloc {
    [_textField release];
    [_label release];
    [super dealloc];
}
@end
