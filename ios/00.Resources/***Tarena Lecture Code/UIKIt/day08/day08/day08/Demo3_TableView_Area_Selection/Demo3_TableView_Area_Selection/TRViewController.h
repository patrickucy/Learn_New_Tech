//
//  TRViewController.h
//  Demo3_TableView_Area_Selection
//
//  Created by apple on 13-6-13.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRArea.h"
#import "TRAreaViewController.h"

@interface TRViewController : UIViewController
    <UITableViewDelegate, UITableViewDataSource, TRAreaDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic) TRArea * selectedArea;

@end
