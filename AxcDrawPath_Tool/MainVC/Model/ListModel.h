//
//  ListModel.h
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/26.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject

+ (ListModel *)title:(NSString *)title disTitle:(NSString *)disTitle path:(UIBezierPath *)path;

@property(nonatomic , strong)NSString *title;
@property(nonatomic , strong)NSString *disTitle;
@property(nonatomic , strong)UIBezierPath *path;

@end

NS_ASSUME_NONNULL_END
