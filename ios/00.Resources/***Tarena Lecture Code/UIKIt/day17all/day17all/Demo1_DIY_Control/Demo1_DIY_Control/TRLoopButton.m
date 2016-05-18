//
//  TRLoopButton.m
//  Demo1_DIY_Control
//
//  Created by apple on 13-6-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRLoopButton.h"

@interface TRLoopButton ()

@property (strong, nonatomic) NSArray * buttonImages;

@end

@implementation TRLoopButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize
{
    UITapGestureRecognizer * tap =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self action:@selector(switchState:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)switchState:(id) sender
{
    [super sendActionsForControlEvents:
        UIControlEventTouchUpInside];
    
    self.currentIndex = (self.currentIndex + 1) %
                        self.buttonImages.count;
}

- (void)setCurrentIndex:(NSUInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self setImage:self.buttonImages[self.currentIndex]
          forState:UIControlStateNormal];
}

- (void)setLoopImages:(NSArray *)images
{
    self.buttonImages = images;
    self.currentIndex = 0;
}

@end
