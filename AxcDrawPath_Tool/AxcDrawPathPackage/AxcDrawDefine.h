#import <UIKit/UIKit.h>

#define AxcDraw_Angle(angle)  (angle)/180.f * M_PI // 弧度转角度
#define AxcDraw_Radians(radians) ((radians) * (180.0 / M_PI)) // 角度转弧度

/** 网格横宽 */
struct AxcAE_Grid {
    NSInteger horizontalCount;
    NSInteger verticalCount;
};
typedef struct CG_BOXABLE AxcAE_Grid AxcAE_Grid;

CG_INLINE AxcAE_Grid
AxcAE_GridMake(NSInteger horizontalCount,NSInteger verticalCount){
    AxcAE_Grid grad;
    grad.horizontalCount = horizontalCount;grad.verticalCount = verticalCount;
    return grad;
}

