//
//  AxcPolarAxis.m
//  AxcAE_Test
//
//  Created by AxcLogo on 2018/10/12.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "AxcPolarAxis.h"

@implementation AxcPolarAxis


+ (CGPoint )AxcPolarAxisCenter:(CGPoint )center
                      distance:(CGFloat )distance
                         angle:(CGFloat )angle{
    return CGPointMake(center.x + distance * cosf(angle),
                       center.y + distance * sinf(angle));
}
+ (CGPoint )AxcPolarAxisCenter:(CGPoint )center
                      distance:(CGFloat )distance
                        radian:(CGFloat )radian{
    return [self AxcPolarAxisCenter:center
                           distance:distance
                              angle:AxcDraw_Angle(radian)];
}

@end
