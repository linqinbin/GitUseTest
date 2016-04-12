//
//  UIImage+QRCodeImage.h
//  TestProject
//
//  Created by linqb on 16/4/12.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCodeImage)


/**
 *  生成条形码
 */
+ (UIImage *)generateBarCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height;

/**
 *  生成二维码
 */
+ (UIImage *)qrImageByContent:(NSString *)content;

//pre
+ (UIImage *)qrImageWithContent:(NSString *)content size:(CGFloat)size;
/**
 *   色值 0~255
 *
 */
+ (UIImage *)qrImageWithContent:(NSString *)content size:(CGFloat)size red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;



+ (UIImage *)qrImageWithContent:(NSString *)content logo:(UIImage *)logo size:(CGFloat)size red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;



@end
