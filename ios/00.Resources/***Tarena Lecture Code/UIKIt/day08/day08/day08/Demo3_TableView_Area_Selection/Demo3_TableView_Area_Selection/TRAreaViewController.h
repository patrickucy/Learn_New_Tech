//
//  TRAreaViewController.h
//  Demo3_Area
//
//  Created by apple on 13-6-8.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRArea.h"

//1. 通过委托声明  建立返回渠道
@class TRAreaViewController;
@protocol TRAreaDelegate <NSObject>
- (void) areaViewController:(TRAreaViewController *)areaViewController
              didSelectArea:(TRArea *)area;
@end

@interface TRAreaViewController : UITableViewController<TRAreaDelegate>

@property (retain, nonatomic) TRArea * area;
@property (assign, nonatomic) id<TRAreaDelegate> delegate;

@end
