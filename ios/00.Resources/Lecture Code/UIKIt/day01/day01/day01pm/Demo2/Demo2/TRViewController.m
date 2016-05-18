//
//  TRViewController.m
//  Demo2
//
//  Created by apple on 13-5-31.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@property (retain, nonatomic) UILabel * label;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //1. 构造
//    CGPoint point = CGPointMake(0, 0);
    CGRect frame = CGRectMake(100, 100, 200, 40);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    //2. 调整
    UIColor *labelTextColor = [UIColor redColor];
    label.textColor = labelTextColor;
    label.text = @"Hello World";
    
    //5.保存引用（指针。对象）
    self.label = label;
    
    //3. 加入
    [self.view addSubview:label];
    
    //4.释放内存
    [label release];
    
    
    
    
//    A.
//    _label = label;
//    
//    B.
//    [_label release];
//    _label = label;
//    [_label retain];
//    
//    C.
//    self.label = label;
//    
//    D.
//    self.label = label;
//    [self.label retain];

    
    
    
    // M1. 试验 Label的其它属性怎么设置
    // M2. 试验 怎么加 UIButton
    
    //1. 构造
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //2. 调整
    button.frame = CGRectMake(100, 200, 100, 44);
    [button setTitle:@"Hello" forState:UIControlStateNormal];
    
    //3. 加入
    [self.view addSubview:button];
    
    
    //*.响应事件
    [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    //当发生para3的事件的时候，要执行para1对象的para2消息
    /* 下面是在UIButton内部 有类似的代码
     id target = ;
     SEL selector = ;
     [target performSelector:selector];
     */
    
}

- (void)tap:(id)sender
{
    self.label.text = @"你好世界";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
