//
//  UIWebView+CaptureContent.m
//  TestProject
//
//  Created by linqinbin on 2016/10/31.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "UIWebView+CaptureContent.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIWebView (CaptureContent)

- (UIImage*)imageRepresentation
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize boundsSize = self.bounds.size;
    CGFloat boundsWidth = boundsSize.width;
    CGFloat boundsHeight = boundsSize.height;
    CGSize contentSize = self.scrollView.contentSize;
    CGFloat contentHeight = contentSize.height;
    CGPoint offset = self.scrollView.contentOffset;
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    NSMutableArray* images = [NSMutableArray array];
    while (contentHeight > 0) {
        UIGraphicsBeginImageContextWithOptions(boundsSize, NO, 0.0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [images addObject:image];

        CGFloat offsetY = self.scrollView.contentOffset.y;
        [self.scrollView setContentOffset:CGPointMake(0, offsetY + boundsHeight)];
        contentHeight -= boundsHeight;
    }
    [self.scrollView setContentOffset:offset];
    CGSize imageSize = CGSizeMake(contentSize.width * scale,
        contentSize.height * scale);
    UIGraphicsBeginImageContext(imageSize);
    [images enumerateObjectsUsingBlock:^(UIImage* image, NSUInteger idx, BOOL* stop) {
        [image drawInRect:CGRectMake(0,
                              scale * boundsHeight * idx,
                              scale * boundsWidth,
                              scale * boundsHeight)];
    }];
    UIImage* fullImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return fullImage;
}

@end
