//
//  TRSingleton.m
//  Demo2_Singleton
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRSingleton.h"

@implementation TRSingleton

static TRSingleton * _sharedInstance;
+ (TRSingleton *) sharedSingleton
{
    if (_sharedInstance == nil) {
        _sharedInstance = [[TRSingleton alloc] init];
    }
    return _sharedInstance;
}
//1.   这个方法在外面怎么调用
//2.   第一次调用和第二次调用以及之后调用的时候.m是如何执行的
//3.   _sharedInstance的内存有没有管理好

@end
