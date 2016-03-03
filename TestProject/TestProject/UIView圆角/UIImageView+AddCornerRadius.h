//
//  UIImageView+AddCornerRadius.h
//  StorytBoardTest
//
//  Created by linqinbin on 16/2/28.
//  Copyright © 2016年 linqinbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AddCornerRadius)
/**
 *  给UIImageView绘制圆角
 *
 *  @param radius 圆角数值
 */
- (void)kt_addImageViewCorner:(CGFloat)radius;

@end
