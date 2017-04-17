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
    CGRect titleRect_temp = self.titleLabel.frame;
    
    imgRect_temp.size = self.cs_imageSize;
    titleRect_temp.size = [self titleSize];
    
    CGFloat margin_x = (self.frame.size.width - (imgRect_temp.size.width + titleRect_temp.size.width) - self.cs_middleDistance) / 2;
    CGFloat margin_y = (self.frame.size.height - (imgRect_temp.size.height + titleRect_temp.size.height) - self.cs_middleDistance) / 2;
    
    CGFloat img_y_h = (self.frame.size.height - imgRect_temp.size.height) / 2;
    CGFloat label_y_h = (self.frame.size.height - titleRect_temp.size.height) / 2;
    
    CGFloat img_x_v = (self.frame.size.width - imgRect_temp.size.width) / 2;
    CGFloat label_x_v = (self.frame.size.width - titleRect_temp.size.width) / 2;
    
    switch (self.cs_buttonImagePositionMode) {
        case CSButtonImagePositionModeRight:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentRight; }
            titleRect_temp.origin = CGPointMake(margin_x, label_y_h);
            imgRect_temp.origin = CGPointMake(margin_x + titleRect_temp.size.width + self.cs_middleDistance, img_y_h);
            
            break;
            
        case CSButtonImagePositionModeTop:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentCenter; }
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y);
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y + imgRect_temp.size.height + self.cs_middleDistance);
            
            break;
            
        case CSButtonImagePositionModeBottom:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentCenter; }
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y);
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y + titleRect_temp.size.height + self.cs_middleDistance);
            
            break;
            
        default:
            self.cs_buttonImagePositionMode = CSButtonImagePositionModeDefault;
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentLeft; }
            imgRect_temp.origin = CGPointMake(margin_x, img_y_h);
            titleRect_temp.origin = CGPointMake(margin_x + imgRect_temp.size.width + self.cs_middleDistance, label_y_h);
            
            break;
    }
    self.imageView.frame = imgRect_temp;
    self.titleLabel.frame = titleRect_temp;
}

-(CGSize)cs_imageSize {
    if (_cs_imageSize.height == 0.0 || _cs_imageSize.width == 0.0) {
        _cs_imageSize = self.imageView.frame.size;
    }
    return _cs_imageSize;
}

-(CGSize)titleSize {
    
    CGFloat maxWidth = 0.0;
    CGFloat maxHeight = 0.0;
    
    CGSize titleSzie = [self calculationStringSizeWith:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    if (self.cs_buttonImagePositionMode == CSButtonImagePositionModeTop ||
        self.cs_buttonImagePositionMode == CSButtonImagePositionModeBottom) {
        if ((self.frame.size.height - self.cs_imageSize.height - _cs_middleDistance) < 0) {
            _cs_middleDistance = 0;
        }
        maxHeight = ceilf(titleSzie.height);
        maxWidth = self.frame.size.width;
    }else {
        if ((self.frame.size.width - self.cs_imageSize.width - _cs_middleDistance) < 0) {
            _cs_middleDistance = 0;
        }
        maxHeight = self.frame.size.height;
        maxWidth = self.frame.size.width - self.cs_imageSize.width - self.cs_middleDistance;
        maxWidth = MIN(maxWidth, ceilf(titleSzie.width));
    }
    titleSzie = CGSizeMake(maxWidth, maxHeight);
    
    return titleSzie;
}

-(CGSize)calculationStringSizeWith:(CGSize)size {
    return [self.titleLabel.text boundingRectWithSize:CGSizeMake(size.width, size.height)
                                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName : self.titleLabel.font}
                                              context:nil].size;
}

@end
