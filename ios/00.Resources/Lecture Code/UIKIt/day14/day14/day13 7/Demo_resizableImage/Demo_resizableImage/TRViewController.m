//
//  TRViewController.m
//  Demo_resizableImage
//
//  Created by apple on 13-6-21.
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
    UIImage * image = [UIImage imageNamed:@"message_i.png"];
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(10, 10, 10, 20);

    UIImage * magicImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch];
    self.imageView.image = magicImage;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
