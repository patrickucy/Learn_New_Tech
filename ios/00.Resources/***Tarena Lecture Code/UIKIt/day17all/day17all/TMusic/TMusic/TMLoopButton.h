//
//  TMLoopButton.h
//  TMusic
//
//  Created by 赵 哲 on 13-6-27.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMLoopButton : UIButton

@property (nonatomic) NSUInteger currentIndex;

- (void) setLoopImages:(NSArray *)images;

- (void) resetButtonImage;

@end
