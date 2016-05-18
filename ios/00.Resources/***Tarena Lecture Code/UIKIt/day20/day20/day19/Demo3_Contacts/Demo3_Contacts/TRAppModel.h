//
//  TRAppModel.h
//  Demo3_Contacts
//
//  Created by apple on 13-7-1.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRAppModel : NSObject

@property (strong, nonatomic) NSMutableArray * contacts;

+ (TRAppModel *) sharedAppModel;

@end
