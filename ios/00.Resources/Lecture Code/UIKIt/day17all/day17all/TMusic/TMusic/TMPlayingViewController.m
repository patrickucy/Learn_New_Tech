//
//  TMPlayingViewController.m
//  TMusic
//
//  Created by 赵 哲 on 13-6-26.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import "TMPlayingViewController.h"

#define FLAG_MAIN_PAD_STATE_CLOSING     1
#define FLAG_MAIN_PAD_STATE_CLOSED      2
#define FLAG_MAIN_PAD_STATE_OPENING     3
#define FLAG_MAIN_PAD_STATE_OPENED      4

@interface TMPlayingViewController()

@property (nonatomic) unsigned int flagMainPadState;

@end

@implementation TMPlayingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.flagMainPadState = FLAG_MAIN_PAD_STATE_CLOSED;
    
    [self setupSubviews];
    
    
}

- (void)setupSubviews
{
    
    self.albumImageView.image = [UIImage imageNamed:@"two.jpg"];
    self.mainTitleLabel.text = @"Ellie Goulding";
    self.subtitleLabel.text = @"Bright Lights";
    
    self.albumImageReflectionView.image = self.albumImageView.image;
    self.albumImageReflectionView.transform = CGAffineTransformMakeScale(1, -1);
    self.albumImageReflectionView.alpha = 0.8;
    
    UIImage * backgroundImageForFunctionPad = [[UIImage imageNamed:@"function_pad_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(16, 16, 16, 16) resizingMode:UIImageResizingModeStretch];
    self.functionPadBackground.image = backgroundImageForFunctionPad;
    
    self.controlPadShadowImageView.image = [UIImage imageNamed:@"control_pad_shadow.png"];
    UIImage * backgroundImageForControlPad = [[UIImage imageNamed:@"control_pad_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    self.controlPadBackground.image = backgroundImageForControlPad;
    
    [self.progressSlider setMinimumTrackImage:[UIImage imageNamed:@"playing_progress_did.png"] forState:UIControlStateNormal];
    [self.progressSlider setMaximumTrackImage:[UIImage imageNamed:@"playing_progress_will.png"] forState:UIControlStateNormal];
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"playing_progress_controller.png"] forState:UIControlStateNormal];
    
    [self.playButton setLoopImages:@[[UIImage imageNamed:@"playing_control_play.png"], [UIImage imageNamed:@"playing_control_pause.png"]]];
    
    [self.playingModeButton setLoopImages:@[[UIImage imageNamed:@"playing_mode_loop.png"], [UIImage imageNamed:@"playing_mode_shuffle.png"], [UIImage imageNamed:@"playing_mode_single_repeat.png"]]];
    
    UIImage * imageForVolumeNow = [[UIImage imageNamed:@"volume_now.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    [self.volumeSlider setMinimumTrackImage:imageForVolumeNow forState:UIControlStateNormal];
    UIImage * imageForVolumeTotal = [[UIImage imageNamed:@"volume_total.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    [self.volumeSlider setMaximumTrackImage:imageForVolumeTotal forState:UIControlStateNormal];
    [self.volumeSlider setThumbImage:[UIImage imageNamed:@"volume_controller.png"] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleMainPad:(id)sender {
    if (self.flagMainPadState == FLAG_MAIN_PAD_STATE_CLOSED  ||
        self.flagMainPadState == FLAG_MAIN_PAD_STATE_CLOSING     ) {
        
        self.flagMainPadState = FLAG_MAIN_PAD_STATE_OPENING;
        
        CGRect frame = self.mainPadView.frame;
        frame.origin.y = -80;
        
        [UIView animateWithDuration:0.6
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
            self.mainPadView.frame = frame;
            self.progressSlider.alpha   = 0.0;
            self.playedTimeLabel.alpha  = 0.0;
            self.totalTimeLabel.alpha   = 0.0;
        } completion:^(BOOL finished){
            if (finished == YES) {
                self.flagMainPadState = FLAG_MAIN_PAD_STATE_OPENED;
            }
        }];
    } else if (self.flagMainPadState == FLAG_MAIN_PAD_STATE_OPENED ||
               self.flagMainPadState == FLAG_MAIN_PAD_STATE_OPENING     ) {
        
        self.flagMainPadState = FLAG_MAIN_PAD_STATE_CLOSING;
        
        CGRect frame = self.mainPadView.frame;
        frame.origin.y = 0;
        
        [UIView animateWithDuration:0.6
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
            self.mainPadView.frame = frame;
            self.progressSlider.alpha   = 1.0;
            self.playedTimeLabel.alpha  = 1.0;
            self.totalTimeLabel.alpha   = 1.0;
        } completion:^(BOOL finished){
            if (finished == YES) {
                self.flagMainPadState = FLAG_MAIN_PAD_STATE_CLOSED;
            }
        }];
    }
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tap:(id)sender
{
    NSLog(@".....");
}


@end
