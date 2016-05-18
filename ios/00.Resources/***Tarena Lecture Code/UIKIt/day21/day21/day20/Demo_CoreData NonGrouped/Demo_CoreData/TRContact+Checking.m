//
//  TRContact+Checking.m
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRContact+Checking.h"

@implementation TRContact (Checking)

- (BOOL) isAdult
{
    return [self.age intValue] >= 18;
}

@end
