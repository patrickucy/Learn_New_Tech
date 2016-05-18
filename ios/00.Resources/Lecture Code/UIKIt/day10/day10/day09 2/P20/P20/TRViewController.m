//
//  TRViewController.m
//  P20
//
//  Created by apple on 13-6-17.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@property (strong, nonatomic) UIImageView * imageView;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Elephant.jpg"]];
    [self.view addSubview:self.imageView];
    [self adjustSizeToFit];
    [self adjustToCenter];
    
    self.imageView.userInteractionEnabled = YES;
    
    UIRotationGestureRecognizer * rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
    
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [self.imageView addGestureRecognizer:panGestureRecognizer];
    
    UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(resize:)];
    [self.imageView addGestureRecognizer:pinchGestureRecognizer];
    
    UITapGestureRecognizer * tapRestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reposition:)];
    tapRestureRecognizer.numberOfTapsRequired = 2;    tapRestureRecognizer.numberOfTouchesRequired = 1;
    [self.imageView addGestureRecognizer:tapRestureRecognizer];
}

- (void)rotate:(UIRotationGestureRecognizer *) rotationGestureRecognizer{
    CGAffineTransform transform = CGAffineTransformRotate(self.imageView.transform, rotationGestureRecognizer.rotation);
    self.imageView.transform = transform;
    rotationGestureRecognizer.rotation = 0.0;
}

- (void)move:(UIPanGestureRecognizer *)panGestureRecognizer
{
    static CGPoint originalCenter;
    if(panGestureRecognizer.state == UIGestureRecognizerStateBegan){
        originalCenter = self.imageView.center;
    } else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [panGestureRecognizer translationInView:self.view];
        CGPoint center = self.imageView.center;
        center.x = originalCenter.x + translation.x;
        center.y = originalCenter.y + translation.y;
        self.imageView.center = center;
    }
}

- (void)resize:(UIPinchGestureRecognizer *) pinchGestureRecognizer{
    CGAffineTransform transform = CGAffineTransformScale(self.imageView.transform, pinchGestureRecognizer.scale,pinchGestureRecognizer.scale);
    self.imageView.transform = transform;
    pinchGestureRecognizer.scale = 1;
}

- (void)reposition:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self adjustSizeToFit];
    [self adjustToCenter];
}

- (void)adjustSizeToFit
{
    //当前要操作的坐标系是self.view
    /*
    CGFloat xScale = self.view.bounds.size.width / self.imageView.frame.size.width;
    CGFloat yScale = self.view.bounds.size.height / self.imageView.frame.size.height;
    CGFloat scale = MIN(xScale, yScale);
    
    CGAffineTransform transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
     */
    
    CGFloat xScale = self.view.bounds.size.width / self.imageView.image.size.width;
    CGFloat yScale = self.view.bounds.size.height / self.imageView.image.size.height;
    CGFloat scale = MIN(xScale, yScale);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    self.imageView.transform = transform;

    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = transform;
    }];
}
- (void)adjustToCenter
{
    CGFloat x = self.view.bounds.size.width / 2;
    CGFloat y = self.view.bounds.size.height / 2;
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.center = CGPointMake(x, y);
    }];
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self adjustSizeToFit];
    [self adjustToCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
