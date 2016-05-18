//
//  TRMessageView.m
//  P26
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMessageView.h"

@implementation TRMessageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setMessage:(NSString *)message
{
    _message = message;
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
#define CORNER_RADIUS 10.0
#define MARGIN 10.0
#define TEXT_WIDTH 200.0

- (void)drawRect:(CGRect)rect
{
    UIFont * font = [UIFont systemFontOfSize:12.0];
    
    CGSize textSize = CGSizeMake(TEXT_WIDTH, 9999.9);
    textSize = [self.message sizeWithFont:font constrainedToSize:textSize];
    
    
    CGFloat textAreaTop = MARGIN + CORNER_RADIUS;
    CGFloat textAreaBotton = textAreaTop + textSize.height;
    CGFloat textAreaRight = rect.size.width - MARGIN - 2 * CORNER_RADIUS;
    CGFloat textAreaLeft = textAreaRight - textSize.width;
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);//状态保存（用于将来撤销）
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:
     CGPointMake(
                 textAreaRight + 2 * CORNER_RADIUS,
                 textAreaBotton + CORNER_RADIUS)];
    
    [path addLineToPoint:
     CGPointMake(
                 textAreaLeft,
                 textAreaBotton + CORNER_RADIUS)];
    
    [path addArcWithCenter:
     CGPointMake(textAreaLeft, textAreaBotton)
                    radius:CORNER_RADIUS
                startAngle:M_PI_2
                  endAngle:M_PI
                 clockwise:YES];
    
    [path addLineToPoint:
     CGPointMake(
                 textAreaLeft - CORNER_RADIUS,
                 textAreaTop)];
    
    [path addArcWithCenter:
     CGPointMake(textAreaLeft, textAreaTop)
                    radius:CORNER_RADIUS
                startAngle:M_PI_2 * 2
                  endAngle:M_PI_2 * 3
                 clockwise:YES];
    
    [path addLineToPoint:
     CGPointMake(
                 textAreaRight,
                 textAreaTop - CORNER_RADIUS)];
    
    [path addArcWithCenter:
     CGPointMake(textAreaRight, textAreaTop)
                    radius:CORNER_RADIUS
                startAngle:M_PI_2 * 3
                  endAngle:M_PI_2 * 4
                 clockwise:YES];
    
    [path addLineToPoint:
     CGPointMake(
                 textAreaRight + CORNER_RADIUS,
                 textAreaBotton)];
    
    [path closePath];
    
    CGContextSetShadow(context, CGSizeMake(1, 1), 4);

    [[UIColor grayColor] setFill];
    [path fill];
    
    CGContextRestoreGState(context);//状态撤销
    
    CGContextSaveGState(context);//状态保存（用于将来撤销） 
    
    [[UIColor whiteColor] setFill];
    
    CGRect rectOfText = CGRectZero;
    rectOfText.origin = CGPointMake(textAreaLeft, textAreaTop);
    rectOfText.size = textSize;
    [self.message drawInRect:rectOfText withFont:font];
    
    CGContextRestoreGState(context);//状态撤销
    
    
    
    
    //state 填充颜色 阴影有没有 线条颜色
    
    
}

@end
