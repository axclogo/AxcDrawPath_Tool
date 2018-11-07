//
//  ViewController.m
//  AxcDrawPath_Tool
//
//  Created by AxcLogo on 2018/10/19.
//  Copyright © 2018 AxcLogo. All rights reserved.
//

#import "ViewController.h"
#import "MainCollectionViewCell.h"

@interface ViewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@property(nonatomic , strong)UICollectionViewFlowLayout *layout;
@property(nonatomic , strong)UICollectionView *collectionView;
@property(nonatomic , strong)NSMutableArray <ListModel *>*dataListArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self settingData];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)createUI{
    self.view.backgroundColor = kVCBackColor;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark - 设置数据
- (void)settingData{
    CGFloat height = self.layout.itemSize.height/2;
    CGFloat width = self.layout.itemSize.width/3;
    /// 线段
    NSMutableArray *points_0 = @[].mutableCopy;
    for (int i = 0 ; i < 40; i ++) {
        CGFloat pointX = i * 5 + 10;
        if (pointX > width) break;
        [points_0 addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, 10)]];
        [points_0 addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, height)]];
        [points_0 addObject:[NSNull null]]; // 断点
    }
    [self.dataListArray addObject:[ListModel title:@"线段绘制 - 循环多段线示例"
                                          disTitle:@"使用遍历数组的方式直接绘制一段或多段折线\n当数组中的元素不为NSValue时，视为折线分割点，并从移动直到下一个NSValue的point的点位"
                                              path:[AxcDrawPath AxcDrawLineArray:points_0]]];
    /// 线段2
    NSMutableArray *points_1 = @[].mutableCopy;
    for (int i = 0 ; i < 3; i ++) { // 折线个数
        for (int j = 0; j < 5 ; j ++) { // 折个数
            int width_ = width; int height_ = height;
            [points_1 addObject:[NSValue valueWithCGPoint:CGPointMake(arc4random()%width_ + 10, arc4random()%height_ + 10)]];
        }
        [points_1 addObject:[NSNull null]]; // 断点
    }
    [self.dataListArray addObject:[ListModel title:@"线段绘制 - 循环随机段线示例"
                                          disTitle:@"使用遍历数组的方式直接绘制一段或多段折线\n当数组中的元素不为NSValue时，视为折线分割点，并从移动直到下一个NSValue的point的点位"
                                              path:[AxcDrawPath AxcDrawLineArray:points_1]]];
    /// 刻度
    [self.dataListArray addObject:[ListModel title:@"刻度绘制 - 刻度线段示例"
                                          disTitle:@"是线段绘制的一种封装变种，一般自定义刻度尺选择组件，或者某种标记组件可以用到"
                                              path:[AxcDrawPath AxcDrawScaleStartPoint:CGPointMake(10, 10)
                                                                                 count:4        // 大刻度个数
                                                                            groupCount:5       // 组内刻度个数
                                                                        bigScaleHeight:30       // 大刻度高度
                                                                      smallScaleHeight:20       // 小刻度高度
                                                                               spacing:5        // 刻度间距
                                                                                upward:NO       // 是否朝上
                                                                              sequence:YES]]];  // 顺序
    /// 四边形
    [self.dataListArray addObject:[ListModel title:@"四边形绘制 - 四边形示例"
                                          disTitle:@"使用CGRect定义四边形的坐标，其实和贝塞尔曲线对象原生的函数一样。。"
                                              path:[AxcDrawPath AxcDrawParallelogramRect:CGRectMake(10, 10,width, height)
                                                                               clockwise:YES]]];
    /// 四边形
    [self.dataListArray addObject:[ListModel title:@"四边形绘制 - 圆角四边形示例"
                                          disTitle:@"原生的绘制方法"
                                              path:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10,width, height)
                                                                              cornerRadius:10]]];
    /// 平行四边形
    [self.dataListArray addObject:[ListModel title:@"四边形绘制 - 水平偏移平行四边形示例"
                                          disTitle:@"使用CGRect定义四边形的坐标，然后使用offset偏移量定义偏移方向绘制四边形\n例如offset为CGPointMake(20, 0)时，代表四边形底部向X轴正向偏移20点"
                                              path:[AxcDrawPath AxcDrawParallelogramRect:CGRectMake(10, 10,width, height)
                                                                                  offset:CGPointMake(20, 0)
                                                                               clockwise:NO]]];
    /// 平行四边形 - 2
    [self.dataListArray addObject:[ListModel title:@"四边形绘制 - 垂直偏移平行四边形示例"
                                          disTitle:@"使用CGRect定义四边形的坐标，然后使用offset偏移量定义偏移方向绘制四边形\n例如offset为CGPointMake(0, 20)时，代表四边形右段向Y轴正向偏移20点"
                                              path:[AxcDrawPath AxcDrawParallelogramRect:CGRectMake(10, 10,width, height - 10)
                                                                                  offset:CGPointMake(0, 20)
                                                                               clockwise:YES]]];
    /// 圆内切多边形
    CGPoint arcCenter = CGPointMake(width/2 +10, height/2 +10);
    CGFloat arcRadius = width/2 - 10;
    [self.dataListArray addObject:[ListModel title:@"圆内切多边形绘制"
                                          disTitle:@"绘制一个多边形，以外圆为交点，依次绘制该多边形形状，可以设置开放角和顶点的个数"
                                              path:[AxcDrawPath AxcDrawParallelogramCenter:arcCenter                // 中心
                                                                                pointCount:6                        // 角个数
                                                                                    radius:arcRadius                // 每个顶点距离心的半径
                                                                                startAngle:60                       // 起始绘制角（弧度）
                                                                              openingAngle:0                        // 开合角
                                                                                 clockwise:NO]]];
    /// 网格绘制 - 无边框
    [self.dataListArray addObject:[ListModel title:@"网格绘制 - 无边框"
                                          disTitle:@"设置一个Rect，在这个范围内定义纵横向的格子数，进行绘制网格"
                                              path:[AxcDrawPath AxcDrawRectangularGridRect:CGRectMake(10, 10,width, height) // frame
                                                                                 gridCount:AxcAE_GridMake(30, 20)       // 横向格子数和纵向格子数
                                                                           firstHorizontal:NO                           // 是否先手横向动作 否则先手纵向动作
                                                                                    border:NO                           // 外框是否要
                                                                                   forward:YES]]];
    /// 网格绘制 - 有边框
    [self.dataListArray addObject:[ListModel title:@"网格绘制 - 带边框"
                                          disTitle:@"设置一个Rect，在这个范围内定义纵横向的格子数，进行绘制网格"
                                              path:[AxcDrawPath AxcDrawRectangularGridRect:CGRectMake(10, 10,width, height) // frame
                                                                                 gridCount:AxcAE_GridMake(30, 20)       // 横向格子数和纵向格子数
                                                                           firstHorizontal:YES                           // 是否先手横向动作 否则先手纵向动作
                                                                                    border:YES                           // 外框是否要
                                                                                   forward:YES]]];
    /// 十字准星绘制
    [self.dataListArray addObject:[ListModel title:@"十字准星绘制"
                                          disTitle:@"确定准星的Center，然后再确定大小Size"
                                              path:[AxcDrawPath AxcDrawReticleCenter:arcCenter size:CGSizeMake(20, 20)]]];
    // 圆形
    [self.dataListArray addObject:[ListModel title:@"圆形绘制 - 圆形示例"
                                          disTitle:@"原生的绘制方法"
                                              path:[UIBezierPath bezierPathWithArcCenter:arcCenter
                                                                                  radius:arcRadius
                                                                              startAngle:0
                                                                                endAngle:AxcDraw_Angle(360)
                                                                               clockwise:NO]]];
    // 辐射圆形
    NSMutableArray *lineHeights = @[].mutableCopy;
    for (int i = 0; i < 50; i ++) [lineHeights addObject:@(arc4random()%30 + 5)];
    [self.dataListArray addObject:[ListModel title:@"辐射圆形绘制 - 辐射圆形示例"
                                          disTitle:@"常规的辐射圆形绘制，需要传入一个高度数组进行运算绘制"
                                              path:[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
                                                                                        radius:arcRadius/2        // 半径
                                                                                   lineHeights:lineHeights]]];   // 每条线长度
    // 辐射圆形 - 2
    [self.dataListArray addObject:[ListModel title:@"辐射圆形绘制 - 辐射圆形开角示例"
                                          disTitle:@"常规的辐射圆形绘制，需要传入一个高度数组进行运算绘制，传入开合角度即可绘制一部分"
                                              path:[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
                                                                                        radius:arcRadius/2        // 半径
                                                                                   lineHeights:lineHeights  // 每条线长度
                                                                                       outside:YES      // 向外绘制
                                                                                    startAngle:-90      // d起始角
                                                                                  openingAngle:90]]]; // 开合角度
    // 辐射圆形 - 3
    [self.dataListArray addObject:[ListModel title:@"辐射圆形绘制 - 向内辐射圆形示例"
                                          disTitle:@"常规的辐射圆形绘制，需要传入一个高度数组进行运算绘制\n只需要控制outside参数即可控制绘制方向"
                                              path:[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
                                                                                        radius:arcRadius        // 半径
                                                                                   lineHeights:lineHeights  // 每条线长度
                                                                                       outside:NO]]];
    // 辐射圆形 - 4
    [lineHeights removeAllObjects];
    for (int i = 0; i < 80; i ++){
        CGFloat value = arc4random()%20 + 5;
        if (arc4random()%2) value = -value;
        [lineHeights addObject:@(value)];
    }
    [self.dataListArray addObject:[ListModel title:@"辐射圆形绘制 - 向内辐射圆形示例"
                                          disTitle:@"常规的辐射圆形绘制，需要传入一个高度数组进行运算绘制\n当然，数组内的正负值也可以控制绘制方向"
                                              path:[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
                                                                                        radius:arcRadius/2        // 半径
                                                                                   lineHeights:lineHeights  // 每条线长度
                                                                                       outside:YES]]];
    // 辐射圆形 - 5
    [lineHeights removeAllObjects];
    for (int i = 0; i < 50; i ++) [lineHeights addObject:@(i)];
    [self.dataListArray addObject:[ListModel title:@"辐射圆形绘制 - 规律递增辐射圆形开角示例"
                                          disTitle:@"常规的辐射圆形绘制，需要传入一个高度数组进行运算绘制，传入开合角度即可绘制一部分"
                                              path:[AxcDrawPath AxcDrawCircularRadiationCenter:arcCenter    // 圆心
                                                                                        radius:arcRadius/2        // 半径
                                                                                   lineHeights:lineHeights  // 每条线长度
                                                                                       outside:YES      // 向外绘制
                                                                                    startAngle:-90      // d起始角
                                                                                  openingAngle:90]]]; // 开合角度
    // 多圆弧 - 1
    [self.dataListArray addObject:[ListModel title:@"多段圆弧绘制"
                                          disTitle:@"绘制多段圆弧，根据圆弧个数，在360度角内平均分配每个弧度"
                                              path:[AxcDrawPath AxcDrawCircularArcCenter:arcCenter  // 中心
                                                                                  radius:arcRadius                    // 半径
                                                                                   count:5                      // 圆弧个数
                                                                                  radian:30                     // 圆弧弧度
                                                                              startAngle:-90-15]]];     // 起始角
    // 多圆弧 - 2
    [self.dataListArray addObject:[ListModel title:@"多段圆弧绘制 - 将圆弧首尾连接"
                                          disTitle:@"绘制多段圆弧，根据圆弧个数，在360度角内平均分配每个弧度，设置连接参数后即可直接获得曲线函数"
                                              path:[AxcDrawPath AxcDrawCircularArcCenter:arcCenter  // 中心
                                                                                  radius:arcRadius                    // 半径
                                                                                   count:3                      // 圆弧个数
                                                                                  radian:30                     // 圆弧弧度
                                                                              startAngle:-90-15
                                                                            openingAngle:0
                                                                              connection:YES]]];
    /// 圆周箭头
    [self.dataListArray addObject:[ListModel title:@"圆周箭头绘制 - 非连接状态"
                                          disTitle:@"绘制箭头，默认指向圆心"
                                              path:[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
                                                                                 radius:arcRadius                     // 半径
                                                                            arrowRadius:10                      // 箭头高度/向心半径差
                                                                            arrowRadian:20                      // 箭头圆弧角度
                                                                             arrowCount:9]]];     // 箭头个数
    /// 圆周箭头 - 2
    [self.dataListArray addObject:[ListModel title:@"圆周箭头绘制 - 圆弧连接状态连接"
                                          disTitle:@"绘制箭头，指向圆心，箭头底部使用圆弧方式连接"
                                              path:[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
                                                                                 radius:arcRadius                     // 半径
                                                                            arrowRadius:10                      // 箭头高度/向心半径差
                                                                            arrowRadian:20                      // 箭头圆弧角度
                                                                             arrowCount:9                       // 箭头个数
                                                                            connections:YES                     // 是否形成闭合圆？
                                                                         arcConnections:YES                     // 是否使用圆弧作为连接边？
                                                                                outSide:NO                     // 箭头向外
                                                                             startAngle:-90-(20/2.f)            // 起始角
                                                                           openingAngle:0                       // 开合角
                                                                              clockwise:YES]]];
    /// 圆周箭头 - 2
    [self.dataListArray addObject:[ListModel title:@"圆周箭头绘制 - 圆弧连接状态连接"
                                          disTitle:@"绘制箭头，反向圆心，箭头底部使用圆弧方式连接"
                                              path:[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
                                                                                 radius:arcRadius                     // 半径
                                                                            arrowRadius:10                      // 箭头高度/向心半径差
                                                                            arrowRadian:20                      // 箭头圆弧角度
                                                                             arrowCount:6                       // 箭头个数
                                                                            connections:YES                     // 是否形成闭合圆？
                                                                         arcConnections:YES                     // 是否使用圆弧作为连接边？
                                                                                outSide:YES                     // 箭头向外
                                                                             startAngle:-90-(20/2.f)            // 起始角
                                                                           openingAngle:0                       // 开合角
                                                                              clockwise:YES]]];
    /// 圆周箭头 - 3
    [self.dataListArray addObject:[ListModel title:@"圆周箭头绘制 - 直线连接状态连接"
                                          disTitle:@"绘制箭头，反向圆心，箭头底部使用直线方式连接"
                                              path:[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
                                                                                 radius:arcRadius/2                     // 半径
                                                                            arrowRadius:10                      // 箭头高度/向心半径差
                                                                            arrowRadian:20                      // 箭头圆弧角度
                                                                             arrowCount:10                       // 箭头个数
                                                                            connections:YES                     // 是否形成闭合圆？
                                                                         arcConnections:NO                     // 是否使用圆弧作为连接边？
                                                                                outSide:YES                     // 箭头向外
                                                                             startAngle:-90-(20/2.f)            // 起始角
                                                                           openingAngle:0                       // 开合角
                                                                              clockwise:YES]]];
    /// 圆周箭头 - 3
    [self.dataListArray addObject:[ListModel title:@"圆周箭头绘制 - 直线连接状态连接"
                                          disTitle:@"绘制箭头，指向圆心，箭头底部使用直线方式连接"
                                              path:[AxcDrawPath AxcDrawPointArrowCenter:arcCenter   // 圆心
                                                                                 radius:arcRadius                     // 半径
                                                                            arrowRadius:10                      // 箭头高度/向心半径差
                                                                            arrowRadian:20                      // 箭头圆弧角度
                                                                             arrowCount:10                       // 箭头个数
                                                                            connections:YES                     // 是否形成闭合圆？
                                                                         arcConnections:NO                     // 是否使用圆弧作为连接边？
                                                                                outSide:NO                     // 箭头向外
                                                                             startAngle:-90-(20/2.f)            // 起始角
                                                                           openingAngle:0                       // 开合角
                                                                              clockwise:YES]]];
    /// 梯形块状圆弧
    [self.dataListArray addObject:[ListModel title:@"梯形块状圆弧绘制"
                                          disTitle:@"绘制梯形围绕圆"
                                              path:[AxcDrawPath AxcDrawTrapezoidalBlockArcRingCenter:arcCenter  // 中心
                                                                                       outsideRadius:arcRadius                    // 外圆半径
                                                                                         blockRadius:10                     // 块半径
                                                                                          blockCount:6                      // 块个数
                                                                                        angleSpacing:10   // 间距角度
                                                                                          startAngle:-115 ]]];
    /// 梯形块状辐射标识
    [self.dataListArray addObject:[ListModel title:@"梯形块状辐射标识绘制"
                                          disTitle:@"梯形块状圆弧的变种图案"
                                              path:[AxcDrawPath AxcDrawTrapezoidalBlockArcRingCenter:arcCenter  // 中心
                                                                                       outsideRadius:arcRadius                    // 外圆半径
                                                                                         blockRadius:arcRadius/3*2                     // 块半径
                                                                                          blockCount:3                      // 块个数
                                                                                        angleSpacing:60   // 间距角度
                                                                                          startAngle:-180 ]]];
    /// 块状圆弧
    [self.dataListArray addObject:[ListModel title:@"块状圆弧绘制"
                                          disTitle:@"绘制块状圆弧围绕圆"
                                              path:[AxcDrawPath AxcDrawBlockArcRingCenter:arcCenter // 绘制中心
                                                                            outsideRadius:arcRadius                   // 外圆半径
                                                                              blockRadius:10                    // 环块距离外部距离
                                                                               blockCount:6                    // 环块个数
                                                                             angleSpacing:10                     // 环块间距弧度
                                                                               startAngle:185                   // 起始角弧度
                                                                             openingAngle:0]]];
    /// 辐射标识
    [self.dataListArray addObject:[ListModel title:@"辐射标识绘制"
                                          disTitle:@"块状圆弧的变种图案"
                                              path:[AxcDrawPath AxcDrawBlockArcRingCenter:arcCenter // 绘制中心
                                                                            outsideRadius:arcRadius                   // 外圆半径
                                                                              blockRadius:arcRadius/3*2                    // 环块距离外部距离
                                                                               blockCount:3                    // 环块个数
                                                                             angleSpacing:60                     // 环块间距弧度
                                                                               startAngle:180                   // 起始角弧度
                                                                             openingAngle:0]]];
    /// 箭头块状圆弧
    [self.dataListArray addObject:[ListModel title:@"箭头块状圆弧绘制 - 逆时针指向"
                                          disTitle:@"块状圆弧的变种函数"
                                              path:[AxcDrawPath AxcDrawArrowBlockArcRingCenter:arcCenter    // 中心
                                                                                 outsideRadius:arcRadius                  // 外圆半径
                                                                                   blockRadius:20                   // 箭头半径
                                                                                    blockCount:6                    // 块个数
                                                                                  angleSpacing:10                   // 角度间距
                                                                                    arrowAngle:10                   // 箭头相对伸出角度
                                                                                    startAngle:-90                  // 起始角度
                                                                                  openingAngle:0                    // 开合角度
                                                                                     clockwise:NO]]];
    /// 箭头块状圆弧 - 2
    [self.dataListArray addObject:[ListModel title:@"箭头块状圆弧绘制 - 顺时针指向"
                                          disTitle:@"块状圆弧的变种函数"
                                              path:[AxcDrawPath AxcDrawArrowBlockArcRingCenter:arcCenter    // 中心
                                                                                 outsideRadius:arcRadius                  // 外圆半径
                                                                                   blockRadius:20                   // 箭头半径
                                                                                    blockCount:6                    // 块个数
                                                                                  angleSpacing:10                   // 角度间距
                                                                                    arrowAngle:10                   // 箭头相对伸出角度
                                                                                    startAngle:-90                  // 起始角度
                                                                                  openingAngle:0                    // 开合角度
                                                                                     clockwise:YES]]];
    
    
    
    [self.collectionView reloadData];
}

#pragma mark - 代理
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataListArray.count;
}
- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"axc" forIndexPath:indexPath];
    cell.model = self.dataListArray[indexPath.row];
    return cell;
}

#pragma mark - 懒加载
- (NSMutableArray <ListModel *>*)dataListArray{
    if (!_dataListArray) {
        _dataListArray = @[].mutableCopy;
    }
    return _dataListArray;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = self.view.backgroundColor;
        [_collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"axc"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [UICollectionViewFlowLayout new];
        _layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 200);
    }
    return _layout;
}

@end
