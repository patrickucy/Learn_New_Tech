//
//  TRSongCell.h
//  Demo1_TableView_NibCell
//
//  Created by apple on 13-6-14.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TRSong.h"

@interface TRSongCell : UITableViewCell

@property (retain, nonatomic) TRSong * song;

@property (retain, nonatomic) IBOutlet UILabel * titleLabel;

@property (retain, nonatomic) IBOutlet UILabel *singerNameLabel;

@property (retain, nonatomic) IBOutlet UILabel *lengthLabel;

@property (retain, nonatomic) IBOutlet UILabel *currentFlagLabel;


@end
