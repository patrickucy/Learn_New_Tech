//
//  TRAppModel.h
//  P04
//
//  Created by apple on 13-6-3.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAppModel : NSObject

- (BOOL) checkUsername:(NSString *)username
          withPassword:(NSString *)password;

@end
