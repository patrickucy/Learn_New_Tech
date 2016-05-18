//
//  TRMessageView2.m
//  Demo1_BezierPath
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMessageView2.h"

@implementation TRMessageView2

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
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width - 10, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width - 10, rect.size.height - 10)];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    [path addLineToPoint:CGPointMake(0, rect.size.height)];
    [path closePath];
    
    [[UIColor grayColor] setFill];
    
    [path fill];
    
    CGContextRestoreGState(context);
}
@end












