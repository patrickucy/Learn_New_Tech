//
//  TRLoopButton.h
//  Demo1_DIY_Control
//
//  Created by apple on 13-6-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRLoopButton : UIButton

@property (nonatomic) NSUInteger currentIndex;

- (void)setLoopImages:(NSArray *)images;

@end
