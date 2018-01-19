//
//  ViewController.m
//  CSButton
//
//  Created by Joslyn wu on 2017/1/4.
//  Copyright © 2017年 joslyn. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ImagePosition.h"


#define kScreeSize ([UIScreen mainScreen].bounds.size)

#define kMargin_x (50)
#define kMargin_y (150)

#define kButton_w_h (100)
#define kButton_h_h (45)

#define kButton_w_v (75)
#define kButton_h_v (100)

#define kTestTitleName (@"小幸运")
#define kTestImgName (@"icon_red")

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI {
    
    [self topImageButton];
    [self bottomImageButton];
    [self centerImageButton];
    [self leftImageButton];
    [self rightImageButton];
}

- (void)topImageButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kMargin_x, kMargin_y, kButton_w_v, kButton_h_v)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_imageSize = CGSizeMake(43, 43);
    button.cs_middleDistance = 6;
    button.cs_imagePositionMode = ImagePositionModeTop;
    button.cs_adjustsImageWhenHighlighted = YES;
}


-(void)bottomImageButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreeSize.width - kMargin_x - kButton_w_v, kMargin_y,  kButton_w_v, kButton_h_v)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    
    button.cs_imageSize = CGSizeMake(32, 43);
    button.cs_middleDistance = 6;
    button.cs_imagePositionMode = ImagePositionModeBottom;
}

-(void)centerImageButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kButton_w_h, kButton_w_h)];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
}

-(void)leftImageButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kMargin_x, kScreeSize.height - kMargin_y - kButton_h_h, kButton_w_h, kButton_h_h)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:@"icon_heart"] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_middleDistance = 6;
    button.cs_imageSize = CGSizeMake(20, 20);
    button.cs_imagePositionMode = ImagePositionModeDefault;
}

-(void)rightImageButton{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kScreeSize.width - kMargin_x - kButton_w_h, kScreeSize.height - kMargin_y - kButton_h_h, kButton_w_h, kButton_h_h)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_imageSize = CGSizeMake(20, 45);
    button.cs_imagePositionMode = ImagePositionModeRight;
}



@end
