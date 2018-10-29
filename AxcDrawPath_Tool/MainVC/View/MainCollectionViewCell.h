//
//  MainCollectionViewCell.h
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/19.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellDrawView.h"
#import "ListModel.h"
#import "AxcDrawPathTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *disTitleLabel;
@property (strong, nonatomic) CellDrawView *drawView;



@property(nonatomic , strong)ListModel *model;

@end

NS_ASSUME_NONNULL_END
