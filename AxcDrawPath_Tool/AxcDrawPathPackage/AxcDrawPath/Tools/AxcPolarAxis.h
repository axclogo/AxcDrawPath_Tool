//
//  AxcPolarAxis.h
//  AxcAE_Test
//
//  Created by AxcLogo on 2018/10/12.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "AxcDrawDefine.h"

NS_ASSUME_NONNULL_BEGIN

/** 极轴坐标转换器 */
@interface AxcPolarAxis : NSObject

/**
 极轴坐标换算
 @param center 中心
 @param distance 距离
 @param angle 角度
 @return 点坐标
 */
+ (CGPoint )AxcPolarAxisCenter:(CGPoint )center
                      distance:(CGFloat )distance
                         angle:(CGFloat )angle;
/**
 极轴坐标换算
 @param center 中心
 @param distance 距离
 @param radian 弧度
 @return 点坐标
 */
+ (CGPoint )AxcPolarAxisCenter:(CGPoint )center
                      distance:(CGFloat )distance
                        radian:(CGFloat )radian;


@end

NS_ASSUME_NONNULL_END
