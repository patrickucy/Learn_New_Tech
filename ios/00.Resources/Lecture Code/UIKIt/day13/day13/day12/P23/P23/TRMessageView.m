//
//  TRMessageView.m
//  P23
//
//  Created by apple on 13-6-20.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMessageView.h"

@implementation TRMessageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //CGContextRef 你要绘制的画布  CGContextRef
    CGContextRef context = UIGraphicsGetCurrentContext();
    //MoveToPoint 下笔的位置
    CGContextMoveToPoint(context, 0, 0);
    //画：准备好要绘制的区域
    CGContextAddLineToPoint(context, rect.size.width - 10, 0);
    CGContextAddLineToPoint(context, rect.size.width - 10, rect.size.height - 20);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height - 10);
    CGContextAddLineToPoint(context, 0, rect.size.height - 10);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextSetShadow(context, CGSizeMake(4, 4), 2);
    
    //准备好调色板并设置填充颜色为灰色
    [[UIColor grayColor] setFill];
    CGContextSetRGBFillColor(context, 0.3, 0.3, 0.3, 1.0);
    //针对描述好的形状区域涂色（调色板中设置好的颜色）
    CGContextFillPath(context);
    
}


@end
