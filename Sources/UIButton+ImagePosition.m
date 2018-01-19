//
//  UIButton+ImagePosition.m
//  CSButton
//
//  Created by Joslyn Wu on 2018/1/19.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import "UIButton+ImagePosition.h"
#import <objc/runtime.h>

@implementation UIButton (ImagePosition)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method layoutSubViews_original = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method layoutSubviews_swizzled = class_getInstanceMethod(self, @selector(cs_layoutSubviews));
        method_exchangeImplementations(layoutSubViews_original, layoutSubviews_swizzled);
    });
}

#pragma mark  -  swizzling
- (void)cs_layoutSubviews {
    [self cs_layoutSubviews];
    if (self.cs_imagePositionMode == ImagePositionModeDefault) {
        return;
    }
    self.adjustsImageWhenHighlighted = self.cs_adjustsImageWhenHighlighted;
    
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
    
    switch (self.cs_imagePositionMode) {
        case ImagePositionModeRight:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentRight; }
            titleRect_temp.origin = CGPointMake(margin_x, label_y_h);
            imgRect_temp.origin = CGPointMake(margin_x + titleRect_temp.size.width + self.cs_middleDistance, img_y_h);
            
            break;
            
        case ImagePositionModeTop:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentCenter; }
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y);
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y + imgRect_temp.size.height + self.cs_middleDistance);
            
            break;
            
        case ImagePositionModeBottom:
            if (!self.titleLabel.textAlignment) { self.titleLabel.textAlignment = NSTextAlignmentCenter; }
            titleRect_temp.origin = CGPointMake(label_x_v, margin_y);
            imgRect_temp.origin = CGPointMake(img_x_v, margin_y + titleRect_temp.size.height + self.cs_middleDistance);
            
            break;
            
        default:
            
            break;
    }
    self.imageView.frame = imgRect_temp;
    self.titleLabel.frame = titleRect_temp;
}

#pragma mark  -  action
-(CGSize)titleSize {
    
    CGFloat maxWidth = 0.0;
    CGFloat maxHeight = 0.0;
    
    CGSize titleSzie = [self calculationStringSizeWith:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    if (self.cs_imagePositionMode == ImagePositionModeTop ||
        self.cs_imagePositionMode == ImagePositionModeBottom) {
        if ((self.frame.size.height - self.cs_imageSize.height - self.cs_middleDistance) < 0) {
            self.cs_middleDistance = 0;
        }
        maxHeight = ceilf(titleSzie.height);
        maxWidth = self.frame.size.width;
    }else {
        if ((self.frame.size.width - self.cs_imageSize.width - self.cs_middleDistance) < 0) {
            self.cs_middleDistance = 0;
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

-(CGSize)cs_imageSize {
    NSValue *imgSizeValue = objc_getAssociatedObject(self, _cmd);
    CGSize imgSize = imgSizeValue.CGSizeValue;
    if (imgSize.height == 0.0 || imgSize.width == 0.0) {
        imgSize = self.imageView.frame.size;
    }
    return imgSize;
}

- (void)setCs_imageSize:(CGSize)cs_imageSize {
    NSValue *imgSizeValue = [NSValue valueWithCGSize:cs_imageSize];
    objc_setAssociatedObject(self, @selector(cs_imageSize), imgSizeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CSImagePositionMode)cs_imagePositionMode {
    return ((NSNumber *)objc_getAssociatedObject(self, _cmd)).integerValue;
}

-(void)setCs_imagePositionMode:(CSImagePositionMode)cs_imagePositionMode {
    objc_setAssociatedObject(self, @selector(cs_imagePositionMode), @(cs_imagePositionMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cs_middleDistance {
    return ((NSNumber *)objc_getAssociatedObject(self, _cmd)).floatValue;
}

- (void)setCs_middleDistance:(CGFloat)cs_middleDistance {
    objc_setAssociatedObject(self, @selector(cs_middleDistance), @(cs_middleDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)cs_adjustsImageWhenHighlighted {
    return ((NSNumber *)objc_getAssociatedObject(self, _cmd)).boolValue;
}

- (void)setCs_adjustsImageWhenHighlighted:(BOOL)enable {
    objc_setAssociatedObject(self, @selector(cs_adjustsImageWhenHighlighted), @(enable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
