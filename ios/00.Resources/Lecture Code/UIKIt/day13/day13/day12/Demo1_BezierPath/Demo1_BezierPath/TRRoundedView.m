//
//  TRRoundedView.m
//  Demo1_BezierPath
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRRoundedView.h"

@implementation TRRoundedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(30, 10)];
    [path addArcWithCenter:CGPointMake(10, 10)
                    radius:20
                startAngle:0
                  endAngle:M_PI_2
                 clockwise:YES];
    [path closePath];
    
    [[UIColor grayColor] setFill];
    [path fill];
    
    CGContextRestoreGState(context);
}


@end
