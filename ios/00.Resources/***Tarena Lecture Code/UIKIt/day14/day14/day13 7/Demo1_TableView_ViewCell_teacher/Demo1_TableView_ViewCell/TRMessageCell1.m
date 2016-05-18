//
//  TRMessageCell1.m
//  Demo1_TableView_ViewCell
//
//  Created by apple on 13-6-21.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRMessageCell1.h"

#define CORNER_RADIUS 10.0
#define MARGIN 10.0
#define TEXT_WIDTH 200.0

@implementation TRMessageCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage * image = [UIImage imageNamed:@"message_i.png"];
        UIImage * resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 20) resizingMode:UIImageResizingModeStretch];
        self.popBackgroundView = [[UIImageView alloc] initWithImage:resizableImage];
        [self addSubview:self.popBackgroundView];
        
        UITextView * textView = [[UITextView alloc] init];
        textView.font = [UIFont systemFontOfSize:12];
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor whiteColor];
        textView.editable = NO;
        textView.scrollEnabled = NO;
        self.textView = textView;
        [self addSubview:textView];
        
    }
    return self;
}

- (void)layoutSubviews
{
    if(self.from == nil){
    UIFont * font = [UIFont systemFontOfSize:12.0];
    CGSize textSize = CGSizeMake(TEXT_WIDTH, 9999.9);
    textSize = [self.message sizeWithFont:font constrainedToSize:textSize];
    CGFloat textAreaTop = MARGIN + CORNER_RADIUS;
    CGFloat textAreaBotton = textAreaTop + textSize.height;
    CGFloat textAreaRight = self.bounds.size.width - MARGIN - 2 * CORNER_RADIUS;
    CGFloat textAreaLeft = textAreaRight - textSize.width;
    
    self.textView.frame = CGRectMake(textAreaLeft, textAreaTop, textSize.width, textSize.height);
    
    CGRect rect = CGRectZero;
    rect.origin.x = textAreaLeft - CORNER_RADIUS;
    rect.origin.y = textAreaTop - CORNER_RADIUS;
    rect.size.width = textSize.width + 3 * CORNER_RADIUS;
    rect.size.height = textSize.height + 2 * CORNER_RADIUS;
    self.popBackgroundView.frame = rect;
    } else {
//        self.popBackgroundView.image = ..../
//        text
//        popBackgroundView
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



- (void)setMessage:(NSString *)message
{
    _message = message;
    self.textView.text = message;
    
    UIFont * font = [UIFont systemFontOfSize:12.0];
    
    CGSize textSize = CGSizeMake(TEXT_WIDTH, 9999.9);
    textSize = [self.message sizeWithFont:font constrainedToSize:textSize];
    
    CGRect bounds = self.bounds;
    bounds.size.height = textSize.height + 2 * MARGIN + 2 * CORNER_RADIUS;
    self.bounds = bounds;
    [self setNeedsDisplay];
}
@end
