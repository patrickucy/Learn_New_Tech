//
//  UIColor+HexString.h
//  TMusic
//
//  Created by 赵 哲 on 13-6-25.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *) colorWithHex:(long)hex;
+ (UIColor *) colorWithHex:(long)hex andAlpha:(float)alpha;

@end
