//
//  TRMessageView.m
//  Demo4
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
        self.message = @"lalalalalalal";
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //测试多行文本占用空间
    CGSize size = CGSizeMake(200.0, 9999.9);
    size = [self.message sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:size];
    NSLog(@"%.2f, %.2f", size.width, size.height);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //使用NSString优化的api绘制文本
    [[UIColor blackColor] setFill];
    CGRect rectOfMessage = CGRectZero;
    rectOfMessage.origin = CGPointMake(10, 10);
    rectOfMessage.size = size;
    [self.message drawInRect:rectOfMessage withFont:[UIFont systemFontOfSize:12]];
    CGContextRestoreGState(context);
}









@end
