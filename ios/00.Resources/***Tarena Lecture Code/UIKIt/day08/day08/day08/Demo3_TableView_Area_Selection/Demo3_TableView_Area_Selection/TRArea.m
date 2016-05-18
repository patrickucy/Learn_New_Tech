//
//  TRArea.m
//  Demo3_Area
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//
    
#import "TRArea.h"

@implementation TRArea

+ (TRArea *) china{
    //  TRArea * beijing = 创建红点
    //  beijing.areaName = 设置红点的绿点
    //  beijing.subAreas = 设置红点的蓝点
    
    TRArea * chaoyang = [[[TRArea alloc] init] autorelease];
    chaoyang.areaName = @"朝阳";
    chaoyang.subAreas = @[];
    
    TRArea * haidian = [[[TRArea alloc] init] autorelease];
    haidian.areaName = @"海淀";
    haidian.subAreas = @[];
    
    TRArea * beijing = [[[TRArea alloc] init] autorelease];
    beijing.areaName = @"北京";
    beijing.subAreas = @[haidian,chaoyang];
    
    TRArea * shanghai = [[[TRArea alloc] init] autorelease];
    shanghai.areaName = @"上海";
    shanghai.subAreas = @[];
    
    TRArea * guangdong = [[[TRArea alloc] init] autorelease];
    guangdong.areaName = @"广东";
    guangdong.subAreas = @[];
    
    TRArea * china = [[[TRArea alloc] init] autorelease];
    china.areaName = @"中国";
    china.subAreas = @[beijing, shanghai, guangdong];
    
    return china;
}

@end








