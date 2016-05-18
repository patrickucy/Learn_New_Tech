//
//  TRMyView.m
//  Demo4_Draw
//
//  Created by apple on 13-6-19.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMyView.h"

@implementation TRMyView

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
    
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 100, 10);
    CGContextAddLineToPoint(context, 10, 100);
    CGContextAddLineToPoint(context, 10, 10);
    
    [[UIColor yellowColor] setFill];
    CGContextFillPath(context);
    
    [[UIColor blackColor] setStroke];
    CGContextStrokePath(context);
    
    
}


@end
