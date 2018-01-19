//
//  UIButton+ImagePosition.h
//  CSButton
//
//  Created by Joslyn Wu on 2018/1/19.
//  Copyright © 2018年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CSImagePositionMode) {
    ImagePositionModeDefault,           // Image is on left, system default style.
    ImagePositionModeRight,             // Image is on right.
    ImagePositionModeTop,               // Image is on top.
    ImagePositionModeBottom             // Image is on bottom.
};

@interface UIButton (ImagePosition)

/// 图片相对于文字的位置。
/// The position of the ImageView relative to the titleLabel.
@property (nonatomic, assign) CSImagePositionMode cs_imagePositionMode;

/// 图片与文字间的间距。
/// Distance between imageVeiw and titleLabel.
@property (nonatomic, assign) CGFloat cs_middleDistance;

/// 期望图片显示尺寸。
/// Custom size for imageView.
@property (nonatomic, assign) CGSize cs_imageSize;

/// 点击时图片是否高亮。默认NO
@property (nonatomic, assign) BOOL cs_adjustsImageWhenHighlighted;

@end
