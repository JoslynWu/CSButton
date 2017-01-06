# CSButton
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/chenaiwubu/CSButton/master/LICENSE) 

### Custom the position of the ImageView relative to the titleLabel in UIButton.

一个UIButon的派生类，可以调整图片与文字相对位置，图片和文字间距，以及图片显示大小。


## 效果展示
![](/Screenshot/CSButton_show.png)

## 接入
- **方式一**：使用pods导入
`pod 'CSButton'`
- **方式二**：将下面文件添加（拖入）项目中
```
CSButton.h
CSButton.m
```

## 功能介绍
1. 调整图片与文字相对位置。
配置`cs_buttonImagePositionType`属性即可
```
@property (nonatomic, assign) CSButtonImagePositionType cs_buttonImagePositionType;
```
它是一个枚举类型：
```
typedef NS_ENUM(NSInteger, CSButtonImagePositionType) {
    CSButtonImagePositionTypeDefault,
    CSButtonImagePositionTypeRight, 
    CSButtonImagePositionTypeTop, 
    CSButtonImagePositionTypeBottom 
};
```
2. 调整图片与文字间的距离
配置`cs_middleDistance`属性即可
```
@property (nonatomic, assign) CGFloat cs_middleDistance;
```
3. 调整图片展示大小
配置`cs_imageViewSize`属性即可
```
@property (nonatomic, assign) CGSize cs_imageViewSize;
``
## 说明
1. 文字和图片都遵循水平竖直居中。
2. 默认关闭了点击时图片高亮效果。如果需要开启则设置`adjustsImageWhenHighlighted`为`YES`。

## Clone

    git clone --recursive https://github.com/chenaiwubu/CSButton.git
