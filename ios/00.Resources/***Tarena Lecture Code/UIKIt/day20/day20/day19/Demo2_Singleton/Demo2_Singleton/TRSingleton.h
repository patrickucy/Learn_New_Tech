//
//  TRSingleton.h
//  Demo2_Singleton
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRSingleton : NSObject
//不让调用alloc或类工厂，
//单例模式下，一般会提供一个静态方法来获取单例对象
+ (TRSingleton *) sharedSingleton;

@property (nonatomic) NSInteger count;

@end
