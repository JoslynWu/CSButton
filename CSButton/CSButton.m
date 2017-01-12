//
//  CSButton.m
//  CSButton
//
//  Created by Joslyn wu on 2017/1/3.
//  Copyright © 2017年 joslyn. All rights reserved.
//

#import "CSButton.h"

@implementation CSButton

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}


-(void)layoutSubviews {
    [super layoutSubviews];

    CGRect imgRect_temp = self.imageView.frame;
    imgRect_temp.size = self.cs_imageSize;
    CGRect titleRect_temp = self.titleLabel.frame;
    
    CGFloat distance_v = 0.0;
    CGFloat distance_h = 0.0;
    
    NSString *title = self.titleLabel.text;
    
    CGSize titleSzie = [title boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.titleLabel.font} context:nil].size;
    
    if (_cs_titleMaxWith) {
        titleSzie.width = _cs_titleMaxWith;
    }
    
    titleRect_temp.size = titleSzie;
    
    if (_cs_buttonImagePositionType == CSButtonImagePositionTypeDefault ||
        _cs_buttonImagePositionType == CSButtonImagePositionTypeRight) {
        distance_h = _cs_middleDistance;
    }else {
        distance_v = _cs_middleDistance;
    }
    
    CGFloat margin_x = (self.frame.size.width - (imgRect_temp.size.width + titleRect_temp.size.width) - distance_h) / 2;
    CGFloat margin_y = (self.frame.size.height - (imgRect_temp.size.height + titleRect_temp.size.height) - distance_v) / 2;
    
    CGFloat img_y_h = (self.frame.size.height - imgRect_temp.size.height) / 2;
    CGFloat label_y_h = (self.frame.size.height - titleSzie.height) / 2;
    
    CGFloat img_x_v = (self.frame.size.width - imgRect_temp.size.width) / 2;
    CGFloat label_x_v = (self.frame.size.width - titleSzie.width) / 2;
    
    switch (self.cs_buttonImagePositionType) {
        case CSButtonImagePositionTypeRight:
            
            titleRect_temp.origin = CGPointMake(margin_x, label_y_h);
            imgRect_temp.origin = CGPointMake(margin_x + titleRect_temp.size.width + distance_h, img_y_h);
            
            break;
            
        case CSButtonImagePositionTypeTop:
            
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y);
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y + imgRect_temp.size.height + distance_v);
            
            break;
            
        case CSButtonImagePositionTypeBottom:
            
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y);
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y + titleRect_temp.size.height + distance_v);
            
            break;
            
        default:
            
            imgRect_temp.origin = CGPointMake(margin_x, img_y_h);
            titleRect_temp.origin = CGPointMake(margin_x + imgRect_temp.size.width + distance_h, label_y_h);
            
            break;
    }
    
    self.imageView.frame = imgRect_temp;
    self.titleLabel.frame = titleRect_temp;
}


-(CGSize)cs_imageSize {
    
    if (_cs_imageSize.height == 0.0 || _cs_imageSize.width == 0.0) {
        
        return self.imageView.frame.size;
    }else {
        return _cs_imageSize;
    }
}



@end
