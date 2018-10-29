# AxcDrawPath_Tool

![language](https://img.shields.io/badge/Language-Objective--C-8E44AD.svg)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
![Platform](https://img.shields.io/badge/platform-%20iOS%20-lightgrey.svg)
![CocoaPods](https://img.shields.io/badge/CocoaPods-1.5.2-brightgreen.svg)
![Axc](https://img.shields.io/badge/Axc-AEKit-orange.svg)

### 简介：
AxcDrawPath_Tool是一个快速贝塞尔曲线绘制工具，其中有现成的图案API可供直接调用，返回对象为 UIBezierPath 。<br><br>
也是从AxcAEKit中拆分出来的一个组件，主要负责绘制计算。<br><br>

### AxcDrawPath_Tool对象说明

AxcDrawPath 是通过类方法，传入参数，进行计算点位，返回UIBezierPath对象的工具类。其中所有涉及到角度参数全为弧度，如M_PI直接传180度即可，其中默认起始角全为-90度；<br><br>
AxcPolarAxis 是一个极坐标转换对象，传入角度或弧度以及起始点和距离即可获得CGPoint坐标点；<br><br>
AxcCAAnimation 是一部分动画的简易封装，这个对象做的不是很完善，但是基础动画够用；<br><br>

### 框架支持
最低支持：iOS 8.0 

IDE：Xcode 9.0 及以上版本 (由于适配iPhone X使用iOS11api，所以请使用Xcode 9.0及以上版本)

### <a id="功能介绍"></a>功能介绍
- [x] 原生的贝塞尔支持
- [x] 自定义Layer动画等
- [x] 支持并不依赖其他三方库
- [x] 轻量级


### 意见和定制

> 如果您在使用中有好的需求及建议，或者遇到什么bug，欢迎随时issue，我会及时的回复
> 另外，支持定制图案哦，谁有好看的图案可以联系我，issue/邮箱都可以。
> 每5个定制图案更新一个版本，并且我会在代码中注释该图案的提供者；支持侵删


# AxcDrawPath示例部分预览
## 线段绘制
![线段绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_0.gif)
### 示例代码：
```
// 先设置需要绘制的点位
NSMutableArray *drawPoints = @[[NSValue valueWithCGPoint:CGPointMake(10, 10)],
[NSValue valueWithCGPoint:CGPointMake(200, 10)],
[NSNull null], // 代表上个点位和下个点位不需要连接,只要不是 NSValue 类型的都会判断为断点
[NSValue valueWithCGPoint:CGPointMake(10, 30)],
[NSValue valueWithCGPoint:CGPointMake(200, 30)],
[NSNull null] // 断点
].mutableCopy;
// 示例完毕，后边就直接循环创建吧
for (int i = 0 ; i < 20; i ++) {
[drawPoints addObject:[NSValue valueWithCGPoint:CGPointMake(10, i * 10 + 50)]];
[drawPoints addObject:[NSValue valueWithCGPoint:CGPointMake(200, i * 10 + 50)]];
[drawPoints addObject:[NSNull null]]; // 断点
}
// 创建绘制动作路径
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawLineArray:drawPoints // 绘制的点位
clockwise:YES];       // 是否顺序绘制
```

## 折线绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_1.gif)
### 示例代码：
```
/// 线段2
NSMutableArray *points_1 = @[].mutableCopy;
for (int i = 0 ; i < 3; i ++) { // 折线个数
for (int j = 0; j < 5 ; j ++) { // 折个数
int width_ = width; int height_ = height;
[points_1 addObject:[NSValue valueWithCGPoint:CGPointMake(arc4random()%width_ + 10, arc4random()%height_ + 10)]];
}
[points_1 addObject:[NSNull null]]; // 断点
}
// 创建绘制动作路径
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawLineArray:points_1 // 绘制的点位
clockwise:YES];       // 是否顺序绘制
```
