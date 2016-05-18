//
//  TRWeiboLoadingView.m
//  Demo3_WeiboLoading
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRWeiboLoadingView.h"

@implementation TRWeiboLoadingView

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center
                    radius:14
                startAngle:M_PI_2 * 3
                  endAngle:M_PI_2 * 3 + self.value * M_PI * 2
                 clockwise:YES];
    [[UIColor whiteColor] setStroke];
    path.lineWidth = 4;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
    
    CGContextRestoreGState(context);
}

- (void)setValue:(float)value
{
    _value = value;
    //    [self drawRect:self.bounds];//100.
    [self setNeedsDisplay];
}


@end










