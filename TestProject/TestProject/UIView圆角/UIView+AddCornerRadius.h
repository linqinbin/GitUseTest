//
//  UIView+AddCornerRadius.h
//  StorytBoardTest
//
//  Created by linqinbin on 16/2/28.
//  Copyright © 2016年 linqinbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddCornerRadius)
/**
 *  给UIView绘制圆角边框
 *
 *  @param radius 圆角数值
 */
- (void)kt_addCorner:(CGFloat)radius;

/**
 *  设置UIView任意一个角的圆角效果
 *
 *  @param corners     指定圆角位置，枚举，可多选 ：UIRectCornerTopLeft | UIRectCornerTopRight |UIRectCornerBottomLeft
 *  @param cornerRadii 圆角大小
 */
- (void)qb_setCornerAnyPositionByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end
