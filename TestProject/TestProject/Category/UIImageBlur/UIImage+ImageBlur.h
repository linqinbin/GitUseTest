//
//  UIImage+ImageBlur.h
//  TestProject
//
//  Created by linqb on 16/8/26.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageBlur)
/**
 *  高斯模糊
 *
 *  @param image 图片
 *  @param blur  模糊程度0....1
 *
 *  @return 模糊后的图片
 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
