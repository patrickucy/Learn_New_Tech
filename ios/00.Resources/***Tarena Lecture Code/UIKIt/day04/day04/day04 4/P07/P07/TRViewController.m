//
//  TRViewController.m
//  P07
//
//  Created by apple on 13-6-6.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    NSString * countStr =
        [NSString stringWithFormat:@"%d", self.count];
    self.title = countStr;
    self.label.text = countStr;
    self.label.font = [UIFont systemFontOfSize:self.count];
}


- (IBAction)next:(id)sender {
    TRViewController * nextViewController =
    [[TRViewController alloc] initWithNibName:@"TRViewController" bundle:nil];
    
    nextViewController.count = self.count - 5;
    [self.navigationController pushViewController:nextViewController animated:YES];
    
    [nextViewController release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [_label release];
    [super dealloc];
}
@end
