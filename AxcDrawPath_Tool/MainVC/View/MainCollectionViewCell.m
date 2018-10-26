//
//  MainCollectionViewCell.m
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/19.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    self.layer.borderColor = KScienceTechnologyBlue.CGColor;
    self.layer.borderWidth = 1;
    self.layer.shadowColor = KScienceTechnologyBlue.CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(0, 0);

    self.titleLabel.textColor = KScienceTechnologyBlue;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    [self.disTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.mas_equalTo(-10);
    }];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(self.mas_centerX).offset(0);
        make.bottom.mas_equalTo(-10);
    }];
}


- (void)setModel:(ListModel *)model{
    _model = model;
    self.titleLabel.text = _model.title;
    self.disTitleLabel.text = _model.disTitle;
    
    self.drawView.showLayer.path = _model.path.CGPath;
    CABasicAnimation *animation = [AxcCAAnimation AxcDrawLineDuration:2 timingFunction:kCAMediaTimingFunctionEaseInEaseOut];
    animation.autoreverses = YES;               // 动画结束时执行逆动画
    animation.repeatCount = HUGE_VALF;          // 重复次数
    [self.drawView.showLayer addAnimation:animation forKey:@"animation"];
}

#pragma mark - 懒加载
- (CellDrawView *)drawView{
    if (!_drawView) {
        _drawView = [CellDrawView new];
        _drawView.layer.masksToBounds = YES;
        _drawView.layer.cornerRadius = 10;
        _drawView.layer.borderColor = [UIColor whiteColor].CGColor;
        _drawView.layer.borderWidth = 1;
        [self addSubview:_drawView];
    }
    return _drawView;
}

@end
