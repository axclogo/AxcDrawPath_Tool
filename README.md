# AxcDrawPath_Tool

![language](https://img.shields.io/badge/Language-Objective--C-8E44AD.svg)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
![Platform](https://img.shields.io/badge/platform-%20iOS%20-lightgrey.svg)
![CocoaPods](https://img.shields.io/badge/CocoaPods-1.5.2-brightgreen.svg)
![Axc](https://img.shields.io/badge/Axc-AEKit-orange.svg)

![AxcAE_DrawPath](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_Header.png)<br>

### 简介：
AxcDrawPath_Tool是一个快速贝塞尔曲线绘制工具，其中有现成的图案API可供直接调用，返回对象为 UIBezierPath 。<br><br>
也是从AxcAEKit中拆分出来的一个组件，主要负责绘制计算。<br><br>
AxcAE系列的组件都以科技风为主，动画为辅，在实际使用中并无太多价值，仅仅是因为爱好而制作的一套专攻科技风类型的工具组件；<br><br>

### AxcDrawPath_Tool对象说明

AxcDrawPath 是通过类方法，传入参数，进行计算点位，返回UIBezierPath对象的工具类。其中所有涉及到角度参数全为弧度，如M_PI直接传180度即可，其中默认起始角全为-90度；<br><br>
AxcPolarAxis 是一个极坐标转换对象，传入角度或弧度以及起始点和距离即可获得CGPoint坐标点；<br><br>
AxcCAAnimation 是一部分动画的简易封装，这个对象做的不是很完善，但是基础动画够用；<br><br>

### 框架支持
最低支持：iOS 8.0 

IDE：Xcode 9.0 及以上版本 (由于适配iPhone X使用iOS11api，所以请使用Xcode 9.0及以上版本)


### <a id="使用方法"></a>使用/安装

* 第一种：手动  
* 1.找到包含：</br>
`AxcCAAnimation.h.m`、</br>
`AxcDrawDefine.h`、</br>
`AxcDrawPath.h.m`、</br>
`AxcPolarAxis.h.m`、</br>
`AxcDrawTools.h`</br>
的`AxcDrawPathPackage`文件夹;</br>
* 2.直接把`AxcDrawPathPackage`文件夹拖入到您的工程中;
* 3.导入 `"AxcDrawTools.h"`
* 第二种：Cocoapods （后续将支持）
* 1.在Podfile 中添加 `pod ''`
* 2.执行 `pod setup`
* 3.执行 `pod install` 或 `pod update`
* 4.导入 `#import <>`


### <a id="功能介绍"></a>功能介绍
- [x] 原生的贝塞尔支持
- [x] 自定义Layer动画等
- [x] 支持并不依赖其他三方库
- [x] 轻量级


### 意见和定制

> 如果您在使用中有好的需求及建议，或者遇到什么bug，欢迎随时issue，我会及时的回复<br>
> 另外，支持定制图案哦，谁有好看的图案可以联系我，issue/邮箱都可以。<br>
> 每5个定制图案更新一个版本，并且我会在代码中注释该图案的提供者；支持侵删<br>


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

## 刻度绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_2.gif)
### 示例代码：
```
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawScaleStartPoint:CGPointMake(20, 100)
count:5        // 大刻度个数
groupCount:10       // 组内个数
bigScaleHeight:30       // 大刻度高度
smallScaleHeight:20       // 小刻度高度
spacing:5        // 刻度间距
upward:NO       // 是否朝上
sequence:YES];     // 顺序绘制
```

## 平行四边形绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_3.gif)
### 示例代码：
```
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawParallelogramRect:CGRectMake(10, 10,width, height)
offset:CGPointMake(20, 0)
clockwise:NO]
```

## 辐射圆绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_4.gif)
### 示例代码：
```
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawCircularRadiationCenter:CGPointMake(200, 200)    // 圆心
radius:50                       // a半径
lineHeights:arr                      // 每条线的长度
outside:YES                      // 向外辐射？
startAngle:-90                      // 起始角
openingAngle:0                        // 开合角
clockwise:YES];                    // 顺时针绘制？
```

## 开角辐射圆绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_5.gif)
### 示例代码：
```
UIBezierPath *bezierPath = [AxcDrawPath AxcDrawCircularRadiationCenter:CGPointMake(200, 200)    // 圆心
radius:50                       // a半径
lineHeights:arr                      // 每条线的长度
outside:YES                      // 向外辐射？
startAngle:-90                      // 起始角
openingAngle:90                        // 开合角
clockwise:YES];                    // 顺时针绘制？
```

## 向内辐射圆绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_6.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
radius:arcRadius        // 半径
lineHeights:lineHeights  // 每条线长度
outside:NO]
```

## 内外辐射圆绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_7.gif)
### 示例代码：
```
for (int i = 0; i < 80; i ++){
CGFloat value = arc4random()%20 + 5;
if (arc4random()%2) value = -value;
[lineHeights addObject:@(value)];
}
[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
radius:arcRadius/2        // 半径
lineHeights:lineHeights  // 每条线长度
outside:YES]
```

## 递增开角辐射圆绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_8.gif)
### 示例代码：
```
for (int i = 0; i < 50; i ++) [lineHeights addObject:@(i)];
[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
radius:arcRadius/2        // 半径
lineHeights:lineHeights  // 每条线长度
outside:YES      // 向外绘制
startAngle:-90      // d起始角
openingAngle:90]
```

## 多圆弧绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_9.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawCircularArcCenter:arcCenter  // 中心
radius:arcRadius                    // 半径
count:5                      // 圆弧个数
radian:30                     // 圆弧弧度
startAngle:-90-15]
```

## 多圆弧首尾相连绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_10.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawCircularArcCenter:arcCenter  // 中心
radius:arcRadius                    // 半径
count:3                      // 圆弧个数
radian:30                     // 圆弧弧度
startAngle:-90-15
openingAngle:0
connection:YES]
```

## 圆周箭头绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_11.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
radius:arcRadius                     // 半径
arrowRadius:10                      // 箭头高度/向心半径差
arrowRadian:20                      // 箭头圆弧角度
arrowCount:9]
```

## 圆周箭头绘制 - 箭头底部圆弧闭合
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_12.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
radius:arcRadius                     // 半径
arrowRadius:10                      // 箭头高度/向心半径差
arrowRadian:20                      // 箭头圆弧角度
arrowCount:9                       // 箭头个数
connections:YES                     // 是否形成闭合圆？
arcConnections:YES                     // 是否使用圆弧作为连接边？
outSide:NO                     // 箭头向外
startAngle:-90-(20/2.f)            // 起始角
openingAngle:0                       // 开合角
clockwise:YES]
```

## 圆周箭头绘制 - 箭头底部圆弧闭合 - 箭头向外
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_13.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
radius:arcRadius                     // 半径
arrowRadius:10                      // 箭头高度/向心半径差
arrowRadian:20                      // 箭头圆弧角度
arrowCount:6                       // 箭头个数
connections:YES                     // 是否形成闭合圆？
arcConnections:YES                     // 是否使用圆弧作为连接边？
outSide:YES                     // 箭头向外
startAngle:-90-(20/2.f)            // 起始角
openingAngle:0                       // 开合角
clockwise:YES]
```

## 圆周箭头绘制 - 箭头底部直线闭合 - 箭头向外
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_14.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
radius:arcRadius/2                     // 半径
arrowRadius:10                      // 箭头高度/向心半径差
arrowRadian:20                      // 箭头圆弧角度
arrowCount:10                       // 箭头个数
connections:YES                     // 是否形成闭合圆？
arcConnections:NO                     // 是否使用圆弧作为连接边？
outSide:YES                     // 箭头向外
startAngle:-90-(20/2.f)            // 起始角
openingAngle:0                       // 开合角
clockwise:YES]
```

## 圆周箭头绘制 - 箭头底部直线闭合 - 箭头向内
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_15.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
radius:arcRadius                     // 半径
arrowRadius:10                      // 箭头高度/向心半径差
arrowRadian:20                      // 箭头圆弧角度
arrowCount:10                       // 箭头个数
connections:YES                     // 是否形成闭合圆？
arcConnections:NO                     // 是否使用圆弧作为连接边？
outSide:NO                     // 箭头向外
startAngle:-90-(20/2.f)            // 起始角
openingAngle:0                       // 开合角
clockwise:YES]
```

## 圆周梯形绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_16.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawTrapezoidalBlockArcRingCenter:arcCenter  // 中心
outsideRadius:arcRadius                    // 外圆半径
blockRadius:10                     // 块半径
blockCount:6                      // 块个数
angleSpacing:10   // 间距角度
startAngle:-115 ]
```

## 圆周块状圆弧绘制
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_17.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawBlockArcRingCenter:arcCenter // 绘制中心
outsideRadius:arcRadius                   // 外圆半径
blockRadius:10                    // 环块距离外部距离
blockCount:6                    // 环块个数
angleSpacing:10                     // 环块间距弧度
startAngle:185                   // 起始角弧度
openingAngle:0]
```

## 圆周块状箭头绘制 - 逆时针
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_18.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawArrowBlockArcRingCenter:arcCenter    // 中心
outsideRadius:arcRadius                  // 外圆半径
blockRadius:20                   // 箭头半径
blockCount:6                    // 块个数
angleSpacing:10                   // 角度间距
arrowAngle:10                   // 箭头相对伸出角度
startAngle:-90                  // 起始角度
openingAngle:0                    // 开合角度
clockwise:NO]
```

## 圆周块状箭头绘制 - 顺时针
![绘制](https://github.com/axclogo/AxcDrawPath_Tool/blob/master/sample_Img/sample_19.gif)
### 示例代码：
```
[AxcDrawPath AxcDrawArrowBlockArcRingCenter:arcCenter    // 中心
outsideRadius:arcRadius                  // 外圆半径
blockRadius:20                   // 箭头半径
blockCount:6                    // 块个数
angleSpacing:10                   // 角度间距
arrowAngle:10                   // 箭头相对伸出角度
startAngle:-90                  // 起始角度
openingAngle:0                    // 开合角度
clockwise:YES]
```


### 更新日志
● 1.0.0:首发; </br>
