//
//  CSButton.h
//  CSButton
//
//  Created by Joslyn wu on 2017/1/3.
//  Copyright © 2017年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CSButtonImagePositionMode) {
    CSButtonImagePositionModeDefault,           // Image is on left, system default style.
    CSButtonImagePositionModeRight,             // Image is on right.
    CSButtonImagePositionModeTop,               // Image is on top.
    CSButtonImagePositionModeBottom             // Image is on bottom.
};

@interface CSButton : UIButton

/// 图片相对于文字的位置。
/// The position of the ImageView relative to the titleLabel.
@property (nonatomic, assign) CSButtonImagePositionMode cs_buttonImagePositionMode;

/// 图片与文字间的间距。
/// Distance between imageVeiw and titleLabel.
@property (nonatomic, assign) CGFloat cs_middleDistance;

/// 期望图片显示尺寸。
/// Custom size for imageView.
@property (nonatomic, assign) CGSize cs_imageSize;

/// 期望文字的最大宽度。
/// The max width for titleLable.
@property (nonatomic, assign) CGFloat cs_titleMaxWidth;

/// 是否允许文字换行，默认不允许（单行）。
/// Support multi-line. Default NO.
@property (nonatomic, assign) BOOL cs_isMultiLines;

@end
