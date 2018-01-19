# CSButton
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/chenaiwubu/CSButton/master/LICENSE) 

### Custom the position of the ImageView relative to the titleLabel in UIButton.

一个UIButon的Category，可以调整图片与文字相对位置，图片和文字间距，指定文字宽度，以及图片显示大小。这是个OC版本。


### Swift版入口：[CSButton-Swift](https://github.com/JoslynWu/CSButton-Swift)

## 特色

- 使用便捷 <—> 用分类实现，想用时添加属性即可。
- 小巧 <—> 只有2个文件

## 效果图

![](/Screenshot/CSButton_show.png)

## 使用

1、 直接将Sources文件夹下文件添加（拖入）到项目中

```
UIButton+ImagePosition.h
UIButton+ImagePosition.m
```

2、 CocoaPods

```
pod 'CSButton'
```

## 功能

1、 调整图片与文字相对位置。

```Objective-C
@property (nonatomic, assign) CSImagePositionMode cs_imagePositionMode;
```

该属性的枚举值：

```Objective-C
typedef NS_ENUM(NSInteger, CSImagePositionMode) {
    ImagePositionModeDefault, 
    ImagePositionModeRight, 
    ImagePositionModeTop, 
    ImagePositionModeBottom
};
```

2、 调整图片与文字间的距离。

```Objective-C
@property (nonatomic, assign) CGFloat cs_middleDistance;
```

3、 调整图片展示大小。

```Objective-C
@property (nonatomic, assign) CGSize cs_imageViewSize;
```

4、 调整点击时图片高亮效果。默认关闭。

```Objective-C
@property (nonatomic, assign) CGSize cs_imageViewSize;
```


