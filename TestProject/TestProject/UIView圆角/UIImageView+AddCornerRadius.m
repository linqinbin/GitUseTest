//
//  UIImageView+AddCornerRadius.m
//  StorytBoardTest
//
//  Created by linqinbin on 16/2/28.
//  Copyright © 2016年 linqinbin. All rights reserved.
//

#import "UIImageView+AddCornerRadius.h"

@implementation UIImageView (AddCornerRadius)

- (void)kt_addImageViewCorner:(CGFloat)radius{
    self.image = [self kt_drawRectWithRoundedCorner:radius sizetoFit:self.bounds.size];
}
- (UIImage *)kt_drawRectWithRoundedCorner:(CGFloat)radius sizetoFit:(CGSize)sizetoFit{
    CGRect rect = CGRectMake(0, 0, sizetoFit.width, sizetoFit.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false,[UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),[UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

@end
