//
//  AxcAE_BezierDrawBrush.h
//  AxcAE_Test
//
//  Created by AxcLogo on 2018/9/19.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "AxcPolarAxis.h"
#import "AxcDrawDefine.h"
#import "AxcCAAnimation.h"

/**
 绘制动作路径
 */
@interface AxcDrawPath : UIBezierPath

#pragma mark - 线段/折线相关
#pragma mark  传入一组点，将其按顺序连接起来
/**
 传入一组点，将其按顺序连接起来 - 1
 @param lineArray 数组点
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawLineArray:(NSArray <NSValue *> *)lineArray;
/**
 传入一组点，将其按顺序连接起来 - 2
 @param lineArray 数组点
 @param clockwise 是否顺时针绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawLineArray:(NSArray <NSValue *> *)lineArray
                         clockwise:(BOOL)clockwise;
#pragma mark 绘制刻度线
/**
 绘制刻度线 - 1
 @param startPoint 起始点位
 @param count 一共多少组
 @param groupCount 每组个数
 @param bigScaleHeight 大刻度线高度
 @param smallScaleHeight 小刻度线高度
 @param spacing 间距
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawScaleStartPoint:(CGPoint )startPoint
                                   count:(NSInteger )count
                              groupCount:(NSInteger )groupCount
                          bigScaleHeight:(CGFloat )bigScaleHeight
                        smallScaleHeight:(CGFloat )smallScaleHeight
                                 spacing:(CGFloat )spacing;
/**
 绘制刻度线 - 2
 @param startPoint 起始点位
 @param count 一共多少组
 @param groupCount 每组个数
 @param bigScaleHeight 大刻度线高度
 @param smallScaleHeight 小刻度线高度
 @param spacing 间距
 @param upward 是否向上
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawScaleStartPoint:(CGPoint )startPoint
                                   count:(NSInteger )count
                              groupCount:(NSInteger )groupCount
                          bigScaleHeight:(CGFloat )bigScaleHeight
                        smallScaleHeight:(CGFloat )smallScaleHeight
                                 spacing:(CGFloat )spacing
                                  upward:(BOOL )upward;
/**
 绘制刻度线 - 3
 @param startPoint 起始点位
 @param count 一共多少组
 @param groupCount 每组个数
 @param bigScaleHeight 大刻度线高度
 @param smallScaleHeight 小刻度线高度
 @param spacing 间距
 @param upward 是否向上
 @param sequence 顺序绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawScaleStartPoint:(CGPoint )startPoint
                                   count:(NSInteger )count
                              groupCount:(NSInteger )groupCount
                          bigScaleHeight:(CGFloat )bigScaleHeight
                        smallScaleHeight:(CGFloat )smallScaleHeight
                                 spacing:(CGFloat )spacing
                                  upward:(BOOL )upward
                                sequence:(BOOL)sequence;
#pragma mark - 多边形相关
#pragma mark 圆周内切多边形
/**
 圆周内切多边形 - 1
 @param center 中心
 @param pointCount 多边形交点个数
 @param radius 半径
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramCenter:(CGPoint )center
                                  pointCount:(NSInteger )pointCount
                                      radius:(CGFloat )radius;
/**
 圆周内切多边形 - 2
 @param center 中心
 @param pointCount 多边形交点个数
 @param radius 半径
 @param startAngle 起始角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramCenter:(CGPoint )center
                                  pointCount:(NSInteger )pointCount
                                      radius:(CGFloat )radius
                                  startAngle:(CGFloat )startAngle;
/**
 圆周内切多边形 - 3
 @param center 中心
 @param pointCount 多边形交点个数
 @param radius 半径
 @param startAngle 起始角
 @param openingAngle 开合角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramCenter:(CGPoint )center
                                  pointCount:(NSInteger )pointCount
                                      radius:(CGFloat )radius
                                  startAngle:(CGFloat )startAngle
                                openingAngle:(CGFloat )openingAngle;
/**
 圆周内切多边形 - 4
 @param center 中心
 @param pointCount 多边形交点个数
 @param radius 半径
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 是否顺时针
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramCenter:(CGPoint )center
                                  pointCount:(NSInteger )pointCount
                                      radius:(CGFloat )radius
                                  startAngle:(CGFloat )startAngle
                                openingAngle:(CGFloat )openingAngle
                                   clockwise:(BOOL)clockwise;
#pragma mark 四边形
/**
 绘制一个四边形 - 1
 @param rect frame
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramRect:(CGRect )rect;
/**
 绘制一个四边形 - 2
 @param rect frame
 @param clockwise 是否顺时针绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramRect:(CGRect )rect
                                 clockwise:(BOOL)clockwise;
#pragma mark 平行四边形
/**
 绘制一个四边形 - 1
 @param rect frame
 @param offset 偏移量
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramRect:(CGRect )rect
                                    offset:(CGPoint )offset;
/**
 绘制一个四边形 - 2
 @param rect frame
 @param offset 偏移量
 @param clockwise 是否顺时针绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawParallelogramRect:(CGRect )rect
                                    offset:(CGPoint )offset
                                 clockwise:(BOOL)clockwise;
#pragma mark - 圆环相关
/**
 绘制圆 - 1
 @param center 中心点
 @param radius 半径
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArcCenter:(CGPoint )center
                            radius:(CGFloat)radius;
/**
 绘制圆 - 2
 @param center 中心点
 @param radius 半径
 @param startAngle 起始弧度
 @param endAngle 终止弧度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArcCenter:(CGPoint )center
                            radius:(CGFloat)radius
                        startAngle:(CGFloat)startAngle
                          endAngle:(CGFloat)endAngle;
/**
 绘制圆 - 3
 @param center 中心点
 @param radius 半径
 @param startAngle 起始弧度
 @param endAngle 终止弧度
 @param clockwise 是否顺时针顺序
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArcCenter:(CGPoint )center
                            radius:(CGFloat)radius
                        startAngle:(CGFloat)startAngle
                          endAngle:(CGFloat)endAngle
                         clockwise:(BOOL)clockwise;
#pragma mark 绘制圆弧
/**
 绘制圆弧 - 1
 @param center 中心
 @param radius 半径
 @param count 圆弧个数
 @param radian 圆弧弧度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularArcCenter:(CGPoint )center
                                    radius:(CGFloat)radius
                                     count:(CGFloat)count
                                    radian:(CGFloat )radian;
/**
 绘制圆弧 - 2
 @param center 中心
 @param radius 半径
 @param count 圆弧个数
 @param radian 圆弧弧度
 @param startAngle 起始角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularArcCenter:(CGPoint )center
                                    radius:(CGFloat)radius
                                     count:(CGFloat)count
                                    radian:(CGFloat )radian
                                startAngle:(CGFloat )startAngle;
/**
 绘制圆弧 - 3
 @param center 中心
 @param radius 半径
 @param count 圆弧个数
 @param radian 圆弧弧度
 @param startAngle 起始角
 @param openingAngle 开合角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularArcCenter:(CGPoint )center
                                    radius:(CGFloat)radius
                                     count:(CGFloat)count
                                    radian:(CGFloat )radian
                                startAngle:(CGFloat )startAngle
                              openingAngle:(CGFloat )openingAngle;
/**
 绘制圆弧 - 4
 @param center 中心
 @param radius 半径
 @param count 圆弧个数
 @param radian 圆弧弧度
 @param startAngle 起始角
 @param openingAngle 开合角
 @param connection 是否连接
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularArcCenter:(CGPoint )center
                                    radius:(CGFloat)radius
                                     count:(CGFloat)count
                                    radian:(CGFloat )radian
                                startAngle:(CGFloat )startAngle
                              openingAngle:(CGFloat )openingAngle
                                connection:(BOOL )connection;
#pragma mark 绘制块状圆弧
/**
 绘制块状圆弧 - 1
 @param center 中心点
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块弧半径
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawBlockArcRingCenter:(CGPoint )center
                              outsideRadius:(CGFloat )outsideRadius
                                blockRadius:(CGFloat )blockRadius
                                 blockCount:(NSInteger )blockCount
                               angleSpacing:(CGFloat )angleSpacing;
/**
 绘制块状圆弧 - 2
 @param center 中心点
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块弧半径
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param startAngle 起始角度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawBlockArcRingCenter:(CGPoint )center
                              outsideRadius:(CGFloat )outsideRadius
                                blockRadius:(CGFloat )blockRadius
                                 blockCount:(NSInteger )blockCount
                               angleSpacing:(CGFloat )angleSpacing
                                 startAngle:(CGFloat )startAngle;
/**
 绘制块状圆弧 - 3
 @param center 中心点
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块弧半径
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param startAngle 起始角度
 @param openingAngle 开口度数
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawBlockArcRingCenter:(CGPoint )center
                              outsideRadius:(CGFloat )outsideRadius
                                blockRadius:(CGFloat )blockRadius
                                 blockCount:(NSInteger )blockCount
                               angleSpacing:(CGFloat )angleSpacing
                                 startAngle:(CGFloat )startAngle
                               openingAngle:(CGFloat )openingAngle;
#pragma mark 绘制箭头块状圆弧
/**
 绘制箭头块状圆弧 - 1
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块距离
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param arrowAngle 箭头突出角度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArrowBlockArcRingCenter:(CGPoint )center
                                   outsideRadius:(CGFloat )outsideRadius
                                     blockRadius:(CGFloat )blockRadius
                                      blockCount:(NSInteger )blockCount
                                    angleSpacing:(CGFloat )angleSpacing
                                      arrowAngle:(CGFloat )arrowAngle;
/**
 绘制箭头块状圆弧 - 2
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块距离
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param arrowAngle 箭头突出角度
 @param startAngle 起始角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArrowBlockArcRingCenter:(CGPoint )center
                                   outsideRadius:(CGFloat )outsideRadius
                                     blockRadius:(CGFloat )blockRadius
                                      blockCount:(NSInteger )blockCount
                                    angleSpacing:(CGFloat )angleSpacing
                                      arrowAngle:(CGFloat )arrowAngle
                                      startAngle:(CGFloat )startAngle;
/**
 绘制箭头块状圆弧 - 3
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块距离
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param arrowAngle 箭头突出角度
 @param startAngle 起始角
 @param openingAngle 开合角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArrowBlockArcRingCenter:(CGPoint )center
                                   outsideRadius:(CGFloat )outsideRadius
                                     blockRadius:(CGFloat )blockRadius
                                      blockCount:(NSInteger )blockCount
                                    angleSpacing:(CGFloat )angleSpacing
                                      arrowAngle:(CGFloat )arrowAngle
                                      startAngle:(CGFloat )startAngle
                                    openingAngle:(CGFloat )openingAngle;
/**
 绘制箭头块状圆弧 - 4
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 圆弧块距离
 @param blockCount 块个数
 @param angleSpacing 间距角度
 @param arrowAngle 箭头突出角度
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 顺时针指向？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawArrowBlockArcRingCenter:(CGPoint )center
                                   outsideRadius:(CGFloat )outsideRadius
                                     blockRadius:(CGFloat )blockRadius
                                      blockCount:(NSInteger )blockCount
                                    angleSpacing:(CGFloat )angleSpacing
                                      arrowAngle:(CGFloat )arrowAngle
                                      startAngle:(CGFloat )startAngle
                                    openingAngle:(CGFloat )openingAngle
                                       clockwise:(BOOL )clockwise;
#pragma mark 绘制梯形块状圆形
/**
 绘制梯形块状圆形 - 1
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 梯形高度
 @param blockCount 块个数
 @param angleSpacing 角度间距
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawTrapezoidalBlockArcRingCenter:(CGPoint )center
                                         outsideRadius:(CGFloat )outsideRadius
                                           blockRadius:(CGFloat )blockRadius
                                            blockCount:(NSInteger )blockCount
                                          angleSpacing:(CGFloat )angleSpacing;
/**
 绘制梯形块状圆形 - 2
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 梯形高度
 @param blockCount 块个数
 @param angleSpacing 角度间距
 @param startAngle 起始角度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawTrapezoidalBlockArcRingCenter:(CGPoint )center
                                         outsideRadius:(CGFloat )outsideRadius
                                           blockRadius:(CGFloat )blockRadius
                                            blockCount:(NSInteger )blockCount
                                          angleSpacing:(CGFloat )angleSpacing
                                            startAngle:(CGFloat )startAngle;
/**
 绘制梯形块状圆形 - 3
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 梯形高度
 @param blockCount 块个数
 @param angleSpacing 角度间距
 @param startAngle 起始角度
 @param openingAngle 开合角度
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawTrapezoidalBlockArcRingCenter:(CGPoint )center
                                         outsideRadius:(CGFloat )outsideRadius
                                           blockRadius:(CGFloat )blockRadius
                                            blockCount:(NSInteger )blockCount
                                          angleSpacing:(CGFloat )angleSpacing
                                            startAngle:(CGFloat )startAngle
                                          openingAngle:(CGFloat )openingAngle;
/**
 绘制梯形块状圆形 - 4
 @param center 中心
 @param outsideRadius 外圆半径
 @param blockRadius 梯形高度
 @param blockCount 块个数
 @param angleSpacing 角度间距
 @param startAngle 起始角度
 @param openingAngle 开合角度
 @param clockwise 顺序绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawTrapezoidalBlockArcRingCenter:(CGPoint )center
                                         outsideRadius:(CGFloat )outsideRadius
                                           blockRadius:(CGFloat )blockRadius
                                            blockCount:(NSInteger )blockCount
                                          angleSpacing:(CGFloat )angleSpacing
                                            startAngle:(CGFloat )startAngle
                                          openingAngle:(CGFloat )openingAngle
                                             clockwise:(BOOL )clockwise;
#pragma mark 绘制指向箭头圆形
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount;
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @param startAngle 起始角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount
                               startAngle:(CGFloat )startAngle;
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @param startAngle 起始角
 @param openingAngle 开合角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount
                               startAngle:(CGFloat )startAngle
                             openingAngle:(CGFloat )openingAngle;
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 顺时针？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount
                               startAngle:(CGFloat )startAngle
                             openingAngle:(CGFloat )openingAngle
                                clockwise:(BOOL )clockwise;
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @param connections 是否连接
 @param arcConnections 使用圆弧形连接
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 顺时针？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount
                              connections:(BOOL )connections
                           arcConnections:(BOOL )arcConnections
                               startAngle:(CGFloat )startAngle
                             openingAngle:(CGFloat )openingAngle
                                clockwise:(BOOL )clockwise;
/**
 绘制指向箭头圆形
 @param center 圆心
 @param radius 半径
 @param arrowRadius 箭头半径
 @param arrowRadian 箭头角度
 @param arrowCount 块个数
 @param connections 是否连接
 @param arcConnections 使用圆弧形连接
 @param outSide 箭头向外？
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 顺时针？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawPointArrowCenter:(CGPoint )center
                                   radius:(CGFloat )radius
                              arrowRadius:(CGFloat )arrowRadius
                              arrowRadian:(CGFloat )arrowRadian
                               arrowCount:(NSInteger )arrowCount
                              connections:(BOOL )connections
                           arcConnections:(BOOL )arcConnections
                                  outSide:(BOOL )outSide
                               startAngle:(CGFloat )startAngle
                             openingAngle:(CGFloat )openingAngle
                                clockwise:(BOOL )clockwise;
#pragma mark 绘制圆形辐射线
/**
 绘制圆形辐射线 - 1
 @param center 圆心
 @param radius 半径
 @param lineHeights 线高组
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularRadiationCenter:(CGPoint )center
                                          radius:(CGFloat )radius
                                     lineHeights:(NSArray <NSNumber *>*)lineHeights;
/**
 绘制圆形辐射线 - 2
 @param center 圆心
 @param radius 半径
 @param lineHeights 线高组
 @param outside 向外辐射？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularRadiationCenter:(CGPoint )center
                                          radius:(CGFloat )radius
                                     lineHeights:(NSArray <NSNumber *>*)lineHeights
                                         outside:(BOOL )outside;
/**
 绘制圆形辐射线 - 3
 @param center 圆心
 @param radius 半径
 @param lineHeights 线高组
 @param outside 向外辐射？
 @param startAngle 起始角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularRadiationCenter:(CGPoint )center
                                          radius:(CGFloat )radius
                                     lineHeights:(NSArray <NSNumber *>*)lineHeights
                                         outside:(BOOL )outside
                                      startAngle:(CGFloat )startAngle;
/**
 绘制圆形辐射线 - 4
 @param center 圆心
 @param radius 半径
 @param lineHeights 线高组
 @param outside 向外辐射？
 @param startAngle 起始角
 @param openingAngle 开合角
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularRadiationCenter:(CGPoint )center
                                          radius:(CGFloat )radius
                                     lineHeights:(NSArray <NSNumber *>*)lineHeights
                                         outside:(BOOL )outside
                                      startAngle:(CGFloat )startAngle
                                    openingAngle:(CGFloat )openingAngle;
/**
 绘制圆形辐射线 - 5
 @param center 圆心
 @param radius 半径
 @param lineHeights 线高组
 @param outside 向外辐射？
 @param startAngle 起始角
 @param openingAngle 开合角
 @param clockwise 顺时针？
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawCircularRadiationCenter:(CGPoint )center
                                          radius:(CGFloat )radius
                                     lineHeights:(NSArray <NSNumber *>*)lineHeights
                                         outside:(BOOL )outside
                                      startAngle:(CGFloat )startAngle
                                    openingAngle:(CGFloat )openingAngle
                                       clockwise:(BOOL )clockwise;

#pragma mark - 网格相关
#pragma mark 绘制矩形网络
/**
 绘制矩形网络 - 1
 @param rect 范围框架
 @param gridCount 网格纵横格子数
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawRectangularGridRect:(CGRect )rect
                                   gridCount:(AxcAE_Grid )gridCount;
/**
 绘制矩形网络 - 2
 @param rect 范围框架
 @param gridCount 网格纵横格子数
 @param forward 是否正向绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawRectangularGridRect:(CGRect )rect
                                   gridCount:(AxcAE_Grid )gridCount
                                     forward:(BOOL)forward;
/**
 绘制矩形网络 - 3
 @param rect 范围框架
 @param gridCount 网格纵横格子数
 @param border 是否要外框
 @param forward 是否正向绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawRectangularGridRect:(CGRect )rect
                                   gridCount:(AxcAE_Grid )gridCount
                                      border:(BOOL )border
                                     forward:(BOOL)forward;
/**
 绘制矩形网络 - 4
 @param rect 范围框架
 @param gridCount 网格纵横格子数
 @param firstHorizontal 先手横向绘制
 @param border 是否要外框
 @param forward 是否正向绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawRectangularGridRect:(CGRect )rect
                                   gridCount:(AxcAE_Grid )gridCount
                             firstHorizontal:(BOOL )firstHorizontal
                                      border:(BOOL )border
                                     forward:(BOOL)forward;
#pragma mark - 准星相关
#pragma mark 绘制十字准星
/**
 绘制十字准星
 @param center s中心
 @param size 大小
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawReticleCenter:(CGPoint )center
                                  size:(CGSize )size;
/**
 绘制十字准星
 @param center s中心
 @param size 大小
 @param connection 顺序绘制
 @return 贝塞尔曲线
 */
+ (UIBezierPath *)AxcDrawReticleCenter:(CGPoint )center
                                  size:(CGSize )size
                            connection:(BOOL )connection;

@end

