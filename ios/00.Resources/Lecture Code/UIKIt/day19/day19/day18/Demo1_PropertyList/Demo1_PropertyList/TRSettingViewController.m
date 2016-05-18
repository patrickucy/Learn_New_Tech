//
//  TRSettingViewController.m
//  Demo1_PropertyList
//
//  Created by apple on 13-6-28.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRSettingViewController.h"

@interface TRSettingViewController ()

@end

@implementation TRSettingViewController

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [[UIApplication sharedApplication]
         openURL:[NSURL URLWithString:
                  @"http://www.tarena.com.cn"]];
    } else if (indexPath.row == 1){
        [[UIApplication sharedApplication]
         openURL:[NSURL URLWithString:
                  @"tel:110"]];
    } else if (indexPath.row == 2){
        [[UIApplication sharedApplication]
         openURL:[NSURL URLWithString:
                  @"http://maps.apple.com/maps?q=cupertino"]];
    }
}

@end
