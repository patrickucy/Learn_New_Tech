//
//  TRArea.h
//  Demo3_Area
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRArea : NSObject

@property (copy, nonatomic) NSString * areaName;
@property (retain, nonatomic) NSArray * subAreas;

+ (TRArea *) china;

@end
