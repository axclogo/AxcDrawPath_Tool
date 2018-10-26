//
//  AxcCAAnimation.h
//  AxcAE_Test
//
//  Created by AxcLogo on 2018/9/18.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 包含一些预设动画
 */
@interface AxcCAAnimation : NSObject

#pragma mark - 线性绘制/贝塞尔绘制

/**
 线性绘制
 @param duration 绘制时间
 @return 动画对象
 */
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration;

/**
 线性绘制
 @param duration 绘制时间
 @param timingFunction 时间曲线
 @return 动画对象
 */
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration
                          timingFunction:(NSString *)timingFunction;

/**
 线性绘制
 @param duration 绘制时间
 @param timingFunction 时间曲线
 @param fromValue 从
 @param toValue 到
 @return 动画对象
 */
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration
                          timingFunction:(NSString *)timingFunction
                               fromValue:(NSNumber *)fromValue
                                 toValue:(NSNumber *)toValue;
#pragma mark - 缩放动画

/**
 缩放效果动画 - 2
 @param duration 周期时间
 @return 动画对象
 */
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration;

/**
 缩放效果动画 - 2
 @param duration 周期时间
 @param timingFunction 时间函数
 @return 动画对象
 */
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration
                        timingFunction:(NSString *)timingFunction;

/**
 缩放效果动画 - 3
 @param duration 周期时间
 @param timingFunction 时间函数
 @param fromValue 从
 @param toValue 到
 @return 动画对象
 */
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration
                        timingFunction:(NSString *)timingFunction
                             fromValue:(NSNumber *)fromValue
                               toValue:(NSNumber *)toValue;
#pragma mark 缩放循环动画

/**
 缩放循环动画
 @param duration 周期时间
 @param timingFunction 时间函数
 @param fromValue 从
 @param toValue 到
 @return 动画对象
 */
+ (CABasicAnimation *)AxcScaleRepeatDuration:(CGFloat )duration
                              timingFunction:(NSString *)timingFunction
                                   fromValue:(NSNumber *)fromValue
                                     toValue:(NSNumber *)toValue;
#pragma mark - 旋转动画

/**
 旋转效果动画 -1
 @param duration 周期时间
 @return 动画对象
 */
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration;

/**
 旋转效果动画 -2
 @param duration 周期时间
 @param clockwise 是否顺时针
 @return 动画对象
 */
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration
                                clockwise:(BOOL )clockwise;

/**
 旋转效果动画 -3
 @param duration 周期时间
 @param clockwise 是否顺时针
 @param timingFunction 时间函数
 @return 动画对象
 */
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration
                           timingFunction:(NSString *)timingFunction
                                clockwise:(BOOL )clockwise;
#pragma mark 来回旋转持续动画
/**
 来回旋转持续动画
 @param duration 周期时间
 @param timingFunction 时间函数
 @param fromValue 从
 @param toValue 到
 @return 动画对象
 */
+ (CABasicAnimation *)AxcRotatingRepeatDuration:(CGFloat )duration
                                 timingFunction:(NSString *)timingFunction
                                      fromValue:(NSNumber *)fromValue
                                        toValue:(NSNumber *)toValue;
#pragma mark - 来回纵/横拉伸
/**
 来回旋转持续动画
 @param duration 周期时间
 @param timingFunction 时间函数
 @param fromValue 从
 @param toValue 到
 @param isY 是否是Y轴
 @return 动画对象
 */
+ (CABasicAnimation *)AxcTensileRepeatDuration:(CGFloat )duration
                                timingFunction:(NSString *)timingFunction
                                     fromValue:(NSNumber *)fromValue
                                       toValue:(NSNumber *)toValue
                                           isY:(BOOL )isY;
#pragma mark - 透明渐变
/**
 渐变出现动画
 @param duration 周期时间
 @return 动画对象
 */
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration;

/**
 渐变出现动画
 @param duration 周期时间
 @param timingFunction 时间曲线
 @return 动画对象
 */
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration
                             timingFunction:(NSString *)timingFunction;

/**
 渐变动画
 @param duration 周期时间
 @param maxOpacity 最大透明度
 @param minOpacity 最小透明度
 @param timingFunction 时间曲线
 @return 动画对象
 */
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration
                                 maxOpacity:(CGFloat )maxOpacity
                                 minOpacity:(CGFloat )minOpacity
                             timingFunction:(NSString *)timingFunction;

#pragma mark - 呼吸/闪烁效果动画
/**
 呼吸效果动画 - 1
 @param duration 周期时间
 @return 动画对象
 */
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration;

/**
 呼吸效果动画 - 2
 @param duration 周期时间
 @param maxOpacity 最大透明度
 @param minOpacity 最小透明度
 @return 动画对象
 */
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration
                                   maxOpacity:(CGFloat )maxOpacity
                                   minOpacity:(CGFloat )minOpacity;

/**
 呼吸效果动画 - 3
 @param duration 周期时间
 @param maxOpacity 最大透明度
 @param minOpacity 最小透明度
 @param timingFunction 时间曲线
 @return 动画对象
 */
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration
                                   maxOpacity:(CGFloat )maxOpacity
                                   minOpacity:(CGFloat )minOpacity
                               timingFunction:(NSString *)timingFunction;

@end
