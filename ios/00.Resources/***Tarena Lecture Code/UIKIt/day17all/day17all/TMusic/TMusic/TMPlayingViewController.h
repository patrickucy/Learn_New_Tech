//
//  TMPlayingViewController.h
//  TMusic
//
//  Created by 赵 哲 on 13-6-26.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMLoopButton.h"

@interface TMPlayingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mainPadView;

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UIImageView * albumImageReflectionView;
@property (weak, nonatomic) IBOutlet UIImageView *controlPadShadowImageView;

@property (weak, nonatomic) IBOutlet UILabel *mainTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;


@property (weak, nonatomic) IBOutlet UIView *controlPadView;

@property (weak, nonatomic) IBOutlet UIImageView *controlPadBackground;

@property (weak, nonatomic) IBOutlet TMLoopButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *playedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;


@property (weak, nonatomic) IBOutlet UIImageView *functionPadBackground;
@property (weak, nonatomic) IBOutlet TMLoopButton *playingModeButton;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;


- (IBAction)toggleMainPad:(id)sender;

- (IBAction)dismiss:(id)sender;
- (IBAction)tap:(id)sender;

@end
