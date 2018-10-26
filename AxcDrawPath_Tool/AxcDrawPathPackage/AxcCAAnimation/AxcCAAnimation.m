//
//  AxcCAAnimation.m
//  AxcAE_Test
//
//  Created by AxcLogo on 2018/9/18.
//  Copyright © 2018年 AxcLogo. All rights reserved.
//

#import "AxcCAAnimation.h"

@implementation AxcCAAnimation

#pragma mark - 线性绘制/贝塞尔绘制
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration{
    return [self AxcDrawLineDuration:duration timingFunction:kCAMediaTimingFunctionLinear];
}
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration
                          timingFunction:(NSString *)timingFunction{
    return [self AxcDrawLineDuration:duration timingFunction:timingFunction
                           fromValue:@(0)
                             toValue:@(1)];
}
+(CABasicAnimation *)AxcDrawLineDuration:(CGFloat )duration
                          timingFunction:(NSString *)timingFunction
                               fromValue:(NSNumber *)fromValue
                                 toValue:(NSNumber *)toValue{
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [self settingCABasicAnimation:pathAniamtion
                        fromValue:fromValue
                          toValue:toValue
                         duration:duration
                   timingFunction:timingFunction];
    pathAniamtion.repeatCount = 1; // 重复次数只需要1次
    return pathAniamtion;
}
#pragma mark - 缩放动画
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration{
    return [self AxcScaleDuration:duration timingFunction:kCAMediaTimingFunctionEaseInEaseOut];
}
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration
                        timingFunction:(NSString *)timingFunction{
    return [self AxcScaleDuration:duration timingFunction:timingFunction fromValue:@(0) toValue:@(1)];
}
+ (CABasicAnimation *)AxcScaleDuration:(CGFloat )duration
                        timingFunction:(NSString *)timingFunction
                             fromValue:(NSNumber *)fromValue
                               toValue:(NSNumber *)toValue{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [self settingCABasicAnimation:scaleAnimation
                        fromValue:fromValue
                          toValue:toValue
                         duration:duration
                   timingFunction:timingFunction];
    scaleAnimation.repeatCount = 1; // 重复次数只需要1次
    return scaleAnimation;
}
#pragma mark 来回缩放循环动画
+ (CABasicAnimation *)AxcScaleRepeatDuration:(CGFloat )duration
                              timingFunction:(NSString *)timingFunction
                                   fromValue:(NSNumber *)fromValue
                                     toValue:(NSNumber *)toValue{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [self settingCABasicAnimation:scaleAnimation
                        fromValue:fromValue
                          toValue:toValue
                         duration:duration
                   timingFunction:timingFunction];
    scaleAnimation.autoreverses = YES;
    return scaleAnimation;
}
#pragma mark - 旋转动画
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration{
    return [self AxcRotatingDuration:duration
                           clockwise:YES];
}
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration
                                clockwise:(BOOL )clockwise{
    return [self AxcRotatingDuration:duration
                      timingFunction:kCAMediaTimingFunctionLinear
                           clockwise:clockwise];
}
+ (CABasicAnimation *)AxcRotatingDuration:(CGFloat )duration
                           timingFunction:(NSString *)timingFunction
                                clockwise:(BOOL )clockwise{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [self settingCABasicAnimation:animation
                        fromValue:@(0)
                          toValue:clockwise? @(2*M_PI) : @(-2*M_PI)
                         duration:duration
                   timingFunction:timingFunction];
    animation.autoreverses = NO; // 不用反复旋转
    return animation;
}
#pragma mark 来回旋转持续动画
+ (CABasicAnimation *)AxcRotatingRepeatDuration:(CGFloat )duration
                                 timingFunction:(NSString *)timingFunction
                                      fromValue:(NSNumber *)fromValue
                                        toValue:(NSNumber *)toValue{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [self settingCABasicAnimation:animation
                        fromValue:fromValue
                          toValue:toValue
                         duration:duration
                   timingFunction:timingFunction];
    animation.autoreverses = YES;
    return animation;
}
#pragma mark - 来回纵/横拉伸
+ (CABasicAnimation *)AxcTensileRepeatDuration:(CGFloat )duration
                                timingFunction:(NSString *)timingFunction
                                     fromValue:(NSNumber *)fromValue
                                       toValue:(NSNumber *)toValue
                                           isY:(BOOL )isY{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:isY ? @"transform.scale.y" :@"transform.scale.x"];
    [self settingCABasicAnimation:scaleAnimation
                        fromValue:fromValue
                          toValue:toValue
                         duration:duration
                   timingFunction:timingFunction];
    scaleAnimation.autoreverses = YES;
    return scaleAnimation;
}
#pragma mark - 透明渐变
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration{
    return [self AxcOpacityWithDuration:duration
                         timingFunction:kCAMediaTimingFunctionLinear];
}
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration
                             timingFunction:(NSString *)timingFunction{
    CABasicAnimation *scaleAnimation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    [self AxcOpacityWithDuration:duration
                      maxOpacity:1
                      minOpacity:0
                  timingFunction:timingFunction];
    return scaleAnimation;
}
+(CABasicAnimation *)AxcOpacityWithDuration:(CGFloat )duration
                                 maxOpacity:(CGFloat )maxOpacity
                                 minOpacity:(CGFloat )minOpacity
                             timingFunction:(NSString *)timingFunction{
    CABasicAnimation *scaleAnimation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    [self settingCABasicAnimation:scaleAnimation
                        fromValue:@(maxOpacity)
                          toValue:@(minOpacity)
                         duration:duration
                   timingFunction:timingFunction];
    scaleAnimation.repeatCount = 1; // 重复次数只需要1次
    return scaleAnimation;
}
#pragma mark - 呼吸/闪烁效果动画
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration{
    return [self AxcBreathingWithDuration:duration
                               maxOpacity:1.0
                               minOpacity:0];
}
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration
                                   maxOpacity:(CGFloat )maxOpacity
                                   minOpacity:(CGFloat )minOpacity{
    return [self AxcBreathingWithDuration:duration
                               maxOpacity:maxOpacity
                               minOpacity:minOpacity
                           timingFunction:kCAMediaTimingFunctionEaseIn];
}
+(CABasicAnimation *)AxcBreathingWithDuration:(CGFloat )duration
                                   maxOpacity:(CGFloat )maxOpacity
                                   minOpacity:(CGFloat )minOpacity
                               timingFunction:(NSString *)timingFunction{
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    [self settingCABasicAnimation:animation
                        fromValue:@(maxOpacity)
                          toValue:@(minOpacity)
                         duration:duration
                   timingFunction:timingFunction];
    return animation;
}

#pragma mark - 共用函数
+ (void)settingCABasicAnimation:(CABasicAnimation *)animation
                      fromValue:(NSNumber *)fromValue
                        toValue:(NSNumber *)toValue
                       duration:(CGFloat )duration
                 timingFunction:(NSString *)timingFunction{
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.duration = duration;
    animation.autoreverses = NO;               // 动画结束时执行逆动画
    animation.repeatCount = HUGE_VALF;          // 重复次数
    animation.fillMode = kCAFillModeForwards;   // 保持动画执行的最后一步状态
    animation.timingFunction=[CAMediaTimingFunction functionWithName:timingFunction];
}


@end
