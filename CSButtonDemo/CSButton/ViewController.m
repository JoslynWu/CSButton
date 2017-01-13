//
//  ViewController.m
//  CSButton
//
//  Created by Joslyn wu on 2017/1/4.
//  Copyright © 2017年 joslyn. All rights reserved.
//

#import "ViewController.h"
#import "CSButton.h"


#define kScreeSize ([UIScreen mainScreen].bounds.size)

#define kMargin_x (50)
#define kMargin_y (150)

#define kButton_w_h (100)
#define kButton_h_h (45)

#define kButton_w_v (75)
#define kButton_h_v (100)

#define kTestTitleName (@"幸运心")
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

-(void)topImageButton{
    
    CSButton *button = [[CSButton alloc] initWithFrame:CGRectMake(kMargin_x, kMargin_y, kButton_w_v, kButton_h_v)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    button.cs_imageSize = CGSizeMake(40, 40);
    button.cs_middleDistance = 6;
    button.cs_buttonImagePositionMode = CSButtonImagePositionModeTop;
}


-(void)bottomImageButton{
    
    CSButton *button = [[CSButton alloc] initWithFrame:CGRectMake(kScreeSize.width - kMargin_x - kButton_w_v, kMargin_y,  kButton_w_v, kButton_h_v)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_imageSize = CGSizeMake(40, 40);
    button.cs_middleDistance = 6;
    button.cs_buttonImagePositionMode = CSButtonImagePositionModeBottom;
}

-(void)centerImageButton{
    
    CSButton *button = [[CSButton alloc] initWithFrame:CGRectMake(0, 0, kButton_w_h, kButton_w_h)];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
}

-(void)leftImageButton{
    
    CSButton *button = [[CSButton alloc] initWithFrame:CGRectMake(kMargin_x, kScreeSize.height - kMargin_y - kButton_h_h, kButton_w_h, kButton_h_h)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_titleMaxWidth = 60;
    button.cs_middleDistance = 6;
    button.cs_imageSize = CGSizeMake(20, 20);
    button.cs_buttonImagePositionMode = CSButtonImagePositionModeDefault;
}

-(void)rightImageButton{
    
    CSButton *button = [[CSButton alloc] initWithFrame:CGRectMake(kScreeSize.width - kMargin_x - kButton_w_h, kScreeSize.height - kMargin_y - kButton_h_h, kButton_w_h, kButton_h_h)];
    [self.view addSubview:button];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:kTestTitleName forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button setImage:[UIImage imageNamed:kTestImgName] forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    button.cs_middleDistance = 6;
    button.cs_imageSize = CGSizeMake(20, 20);
    button.cs_buttonImagePositionMode = CSButtonImagePositionModeRight;
}



@end
