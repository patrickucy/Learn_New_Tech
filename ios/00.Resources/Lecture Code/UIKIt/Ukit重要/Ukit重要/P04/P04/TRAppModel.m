//
//  TRAppModel.m
//  P04
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRAppModel.h"

@interface TRAppModel ()

@property (retain, nonatomic) NSArray * usersData;
@end
@implementation TRAppModel

#define kUsername @"username"
- (id) init{
    if(self = [super init]){
        self.usersData =
        @[@{kUsername:@"u1", @"password":@"p1"},
        @{kUsername:@"u2", @"password":@"p2"}];
    }
    return self;
}
- (BOOL) checkUsername:(NSString *)username
          withPassword:(NSString *)password{
    
    for(NSDictionary * userdata in self.usersData){
        //要输入的名字和密码和形参相比较是否相等
        if ([userdata[kUsername] isEqualToString:username]
            &&
            [userdata[@"password"] isEqualToString:password]
            ) {
            return YES;
        }
    }
    return NO;
}

@end
