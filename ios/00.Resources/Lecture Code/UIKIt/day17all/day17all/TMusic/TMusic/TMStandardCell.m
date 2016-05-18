//
//  TMStandardCell.m
//  TMusic
//
//  Created by 赵 哲 on 13-6-26.
//  Copyright (c) 2013年 Zhe Zhao. All rights reserved.
//

#import "TMStandardCell.h"

@implementation TMStandardCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIImage * backgroundImage = [[UIImage imageNamed:@"cell_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                                                          resizingMode:UIImageResizingModeStretch];
        self.backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
        
        
        UIImage * selectedBackgroundImage = [[UIImage imageNamed:@"cell_back_selected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                                                          resizingMode:UIImageResizingModeStretch];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBackgroundImage];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
