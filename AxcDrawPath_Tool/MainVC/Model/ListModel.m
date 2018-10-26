//
//  ListModel.m
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/26.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+ (ListModel *)title:(NSString *)title disTitle:(NSString *)disTitle path:(UIBezierPath *)path{
    ListModel *model = [ListModel new];
    model.title = title;
    model.disTitle = disTitle;
    model.path = path;
    return model;
}

@end
