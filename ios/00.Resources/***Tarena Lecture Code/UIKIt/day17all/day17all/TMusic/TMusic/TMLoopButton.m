//
//  TMLoopButton.m
//  TMusic
//
//  Created by 赵 哲 on 13-6-27.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import "TMLoopButton.h"

@interface TMLoopButton()

@property (strong, nonatomic) NSArray * buttonImages;

@end

@implementation TMLoopButton

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
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchState:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)switchState:(UITapGestureRecognizer *) tapGestureRecognizer
{
    [super sendActionsForControlEvents:UIControlEventTouchUpInside];
    self.currentIndex = (self.currentIndex + 1) % self.buttonImages.count;
}

- (void)setCurrentIndex:(NSUInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self setImage:self.buttonImages[_currentIndex] forState:UIControlStateNormal];
}

- (void)setLoopImages:(NSArray *)images
{
    self.buttonImages = images;
    self.currentIndex = 0;
}

- (void)resetButtonImage
{
    [self setCurrentIndex:0];
}

@end
