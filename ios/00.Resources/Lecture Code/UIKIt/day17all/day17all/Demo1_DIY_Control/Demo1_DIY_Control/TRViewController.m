//
//  TRViewController.m
//  Demo1_DIY_Control
//
//  Created by apple on 13-6-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

#define BUTTON_STATE_WAITING    0
#define BUTTON_STATE_PLAY       1
#define BUTTON_STATE_PAUSE      2

#define PLAYING_MODE_BUTTON_STATE_CYCLE         0
#define PLAYING_MODE_BUTTON_STATE_SHUFFLE       0
#define PLAYING_MODE_BUTTON_STATE_SINGLE_REPEAT 0


@interface TRViewController ()

@property (nonatomic) NSUInteger buttonState;
@property (nonatomic) NSUInteger playingModeButtonState;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buttonState = BUTTON_STATE_PLAY;
    [self.loopButton setLoopImages:
     @[
    [UIImage imageNamed:@"playing_control_pause.png"],
    [UIImage imageNamed:@"playing_control_play.png"]]
     ];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)urlRequest:(.....)request didLoadResourceData:(NSData *)data
{
    self.buttonState = BUTTON_STATE_PLAY;
    [self.button setImage:[UIImage imageNamed:@"playing_control_play.png"]
                 forState:UIControlStateNormal];
}
 */

- (IBAction)tap:(id)sender {
    if(self.buttonState == BUTTON_STATE_WAITING){
        // nothing
    }else if (self.buttonState == BUTTON_STATE_PLAY) {
        self.buttonState = BUTTON_STATE_PAUSE;
        [self.button setImage:[UIImage imageNamed:@"playing_control_pause.png"]
                     forState:UIControlStateNormal];
    } else if (self.buttonState == BUTTON_STATE_PAUSE) {
        self.buttonState = BUTTON_STATE_PLAY;
        [self.button setImage:[UIImage imageNamed:@"playing_control_play.png"]
                     forState:UIControlStateNormal];
    }
}
/*
 
- (IBAction)tap2:(id)sender {
    IF(SINGLE)
        .STATE = SHUFFLE
    ELSE IF(SHUFFLE)
        .STATE = CYCLE
    ELSE IF(CYCLE)
        .STATE = MAGIC
    ELSE IF(MAGIC)
        .SINGLE
    
}

*/
- (IBAction)tap2:(TRLoopButton *)sender {
//    if(sender.currentIndex == 0){
//        [self.music play];
//    }
    NSLog(@"hihihihi");
}
@end
