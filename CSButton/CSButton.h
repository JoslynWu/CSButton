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

/// The position of the ImageView relative to the titleLabel
@property (nonatomic, assign) CSButtonImagePositionMode cs_buttonImagePositionMode;

/// Distance between imageVeiw and titleLabel.
@property (nonatomic, assign) CGFloat cs_middleDistance;

/// Custom size for imageView
@property (nonatomic, assign) CGSize cs_imageSize;

/// The max width for titleLable
@property (nonatomic, assign) CGFloat cs_titleMaxWidth;

@end
