//
//  CSButton.h
//  CSButton
//
//  Created by Joslyn wu on 2017/1/3.
//  Copyright © 2017年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CSButtonImagePositionType) {
    CSButtonImagePositionTypeDefault,           // Image is on left, system default style.
    CSButtonImagePositionTypeRight,             // Image is on right.
    CSButtonImagePositionTypeTop,               // Image is on top.
    CSButtonImagePositionTypeBottom             // Image is on bottom.
};

@interface CSButton : UIButton

/// The position of the ImageView relative to the titleLabel
@property (nonatomic, assign) CSButtonImagePositionType cs_buttonImagePositionType;

/// Distance between imageVeiw and titleLabel.
@property (nonatomic, assign) CGFloat cs_middleDistance;

/// Custom size for imageView
@property (nonatomic, assign) CGSize cs_imageSize;

/// The max with for titleLable
@property (nonatomic, assign) CGFloat cs_titleMaxWith;

@end
