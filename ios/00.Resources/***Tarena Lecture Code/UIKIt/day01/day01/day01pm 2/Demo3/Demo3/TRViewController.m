//
//  TRViewController.m
//  Demo3
//
//  Created by apple on 13-5-31.
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

- (IBAction)slide:(id)sender {
    //方法1 需要连接UISlider的outlet
    self.label.text = [NSString stringWithFormat:@"%f", self.slider.value];
    
    //方法2 不需要连接，因为消息的发送者就是我们要取数据的UISlider
    UISlider * senderSlider = sender;
    self.label.text = [NSString stringWithFormat:@"%f", senderSlider.value];
    
    //方法3 不需要连接，不需要强转 因为返回值是基础类型 所以不能这么玩
//    self.label.text = [NSString stringWithFormat:@"%f", [sender value]];
}


- (void)dealloc {
    [_label release];
    [_slider release];
    [super dealloc];
}
@end
