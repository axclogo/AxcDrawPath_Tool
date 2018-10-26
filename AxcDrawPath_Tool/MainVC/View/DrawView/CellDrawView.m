//
//  CellDrawView.m
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/26.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "CellDrawView.h"

@implementation CellDrawView


- (void)layoutSubviews{
    [super layoutSubviews];
    self.showLayer.frame = self.bounds;
}

- (CAShapeLayer *)showLayer{
    if (!_showLayer) {
        _showLayer = [CAShapeLayer new];
        _showLayer.lineWidth = 1;
        _showLayer.strokeColor = KScienceTechnologyBlue.CGColor;
        _showLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_showLayer];
    }
    return _showLayer;
}

@end
