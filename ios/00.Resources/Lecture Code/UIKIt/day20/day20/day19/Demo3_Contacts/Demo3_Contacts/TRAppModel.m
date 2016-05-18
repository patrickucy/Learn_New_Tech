//
//  TRAppModel.m
//  Demo3_Contacts
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAppModel.h"

@implementation TRAppModel

static TRAppModel * _sharedInstance;

+ (TRAppModel *)sharedAppModel
{
    if (_sharedInstance == nil) {
        _sharedInstance = [[TRAppModel alloc] init];
    }
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.contacts = [NSMutableArray array];
    }
    return self;
}

@end
