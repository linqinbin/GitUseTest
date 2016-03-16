//
//  UIView+AddCornerRadius.m
//  StorytBoardTest
//
//  Created by linqinbin on 16/2/28.
//  Copyright © 2016年 linqinbin. All rights reserved.
//

#import "UIView+AddCornerRadius.h"

@implementation UIView (AddCornerRadius)


- (void)kt_addCorner:(CGFloat)radius{
    [self kt_addCorner:radius borderWidth:1 backgroundColor:[UIColor clearColor] borderColor:[UIColor blackColor]];
}
- (void)kt_addCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor{
    UIImageView *imageView  = [[UIImageView alloc]initWithImage:[self kt_drawRectWithRoundedCorner:radius borderWidth:borderWidth backgroundColor:backgroundColor borderColor:borderColor]];
    [self insertSubview:imageView atIndex:0];
}

- (UIImage *)kt_drawRectWithRoundedCorner:(CGFloat)radius borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor{
    CGSize sizeToFit = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    CGFloat halfBorderWidth = borderWidth / 2.0;
    UIGraphicsBeginImageContextWithOptions(sizeToFit, false, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGFloat width = sizeToFit.width;
    CGFloat height = sizeToFit.height;
    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius); // 右上角

    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}

- (void)qb_setCornerAnyPositionByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
