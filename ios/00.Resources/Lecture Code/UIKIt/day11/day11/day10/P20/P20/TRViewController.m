//
//  TRViewController.m
//  P20
//
//  Created by apple on 13-6-17.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIImageView * imageView;

@property (strong, nonatomic) UILabel * mainConsoleLabel;
@property (strong, nonatomic) UILabel * secondConsoleLabel;

@property (strong, nonatomic) UIPinchGestureRecognizer * pinchGestureRecognizer;
@property (strong, nonatomic) UIRotationGestureRecognizer * rotationGestureRecognizer;


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
    
    self.mainConsoleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    self.mainConsoleLabel.textColor = [UIColor whiteColor];
    self.mainConsoleLabel.shadowOffset = CGSizeMake(1, 1);
    self.mainConsoleLabel.shadowColor = [UIColor blackColor];
    self.mainConsoleLabel.backgroundColor = [UIColor clearColor];
    self.mainConsoleLabel.text = @"mainConsoleLabel";
    [self.view addSubview:self.mainConsoleLabel];
    
    self.secondConsoleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 20)];
    self.secondConsoleLabel.textColor = [UIColor whiteColor];
    self.secondConsoleLabel.shadowOffset = CGSizeMake(1, 1);
    self.secondConsoleLabel.shadowColor = [UIColor blackColor];
    self.secondConsoleLabel.backgroundColor = [UIColor clearColor];
    self.secondConsoleLabel.text = @"secondConsoleLabel";
    [self.view addSubview:self.secondConsoleLabel];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIRotationGestureRecognizer * rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    rotationGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
    self.rotationGestureRecognizer = rotationGestureRecognizer;
    
    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [self.imageView addGestureRecognizer:panGestureRecognizer];
    
    UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(resize:)];
    pinchGestureRecognizer.delegate = self;
    [self.imageView addGestureRecognizer:pinchGestureRecognizer];
    self.pinchGestureRecognizer = pinchGestureRecognizer;
    
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reposition:)];
    tapGestureRecognizer.numberOfTapsRequired = 2;    tapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.imageView addGestureRecognizer:tapGestureRecognizer];
    
    UITapGestureRecognizer * singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(check:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    singleTapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.imageView addGestureRecognizer:singleTapGestureRecognizer];
}
- (void)check:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint locationInView = [tapGestureRecognizer locationInView:self.view];
    CGPoint locationInImageView = [tapGestureRecognizer locationInView:self.imageView];
    
    UILabel * aLabel = [[UILabel alloc] initWithFrame:CGRectMake(locationInImageView.x, locationInImageView.y, 100, 100)];
    aLabel.backgroundColor = [UIColor clearColor];
    aLabel.textColor = [UIColor redColor];
    aLabel.font = [UIFont systemFontOfSize:72];
    aLabel.text = @"*";
    [self.imageView addSubview:aLabel];
    
    self.mainConsoleLabel.text = [NSString stringWithFormat:@"view: %.2f, %.2f", locationInView.x, locationInView.y];
    self.secondConsoleLabel.text = [NSString stringWithFormat:@"imageView: %.2f, %.2f", locationInImageView.x, locationInImageView.y];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer   shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
//    return YES;
    if (gestureRecognizer == self.pinchGestureRecognizer) {
        return otherGestureRecognizer == self.rotationGestureRecognizer;
    } else if (gestureRecognizer == self.rotationGestureRecognizer){
        return otherGestureRecognizer == self.pinchGestureRecognizer;
    }
    
    return NO;
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
