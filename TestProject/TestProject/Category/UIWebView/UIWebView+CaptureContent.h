//
//  UIWebView+CaptureContent.h
//  TestProject
//
//  Created by linqinbin on 2016/10/31.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (CaptureContent)
/**
 *  UIWebView截取内容为图片（UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);//保存到本地图库）
 *
 *  @return 截图的图片
 */
- (UIImage*)imageRepresentation;

@end
