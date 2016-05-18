//
//  TRViewController.m
//  Demo3_Keyboard
//
//  Created by apple on 13-6-24.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inputBackground.image = [[UIImage imageNamed:@"input_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    self.textFieldBackground.image = [[UIImage imageNamed:@"input_text_field_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18) resizingMode:UIImageResizingModeStretch];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary * notificationInfo = notification.userInfo;
    CGRect frameOfKeyboard = [notificationInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSTimeInterval duration = [notificationInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [notificationInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    UIView * window = [[[UIApplication sharedApplication] delegate] window];
    //将键盘本身的相对于屏幕的坐标系frame转换为当前view坐标系的坐标
    frameOfKeyboard = [self.view convertRect:frameOfKeyboard fromView:window];
    CGRect frameOfInputView = self.inputView.frame;
    frameOfInputView.origin.y = frameOfKeyboard.origin.y - self.inputView.frame.size.height;
    CGRect frameOfTableView = self.tableView.frame;
    frameOfTableView.size.height = frameOfInputView.origin.y;
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:options
                     animations:^{
        self.inputView.frame = frameOfInputView;
        self.tableView.frame = frameOfTableView;
                     }
                     completion:nil];
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary * notificationInfo = notification.userInfo;
    CGRect frameOfKeyboard = [notificationInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect frameOfInputView = self.inputView.frame;
    frameOfInputView.origin.y = self.view.bounds.size.height - self.inputView.frame.size.height;
    //    [UIView animateWithDuration:0.5 animations:^{
    self.inputView.frame = frameOfInputView;
    //    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(id)sender {
    [self.textField resignFirstResponder];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}
@end
