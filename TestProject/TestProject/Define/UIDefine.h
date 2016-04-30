//
//  UIDefine.h
//  TestProject
//
//  Created by linqb on 16/4/28.
//  Copyright © 2016年 linqb. All rights reserved.
//

#ifndef UIDefine_h
#define UIDefine_h

static CGFloat const XYZBrandingFontSizeSmall = 12.0f;
static NSString * const XYZAwesomenessDeliveredNotificationName = @"foo";


#define UIColorFromRGB(rgbValue) [UIColor                       \
colorWithRed:(float)(((rgbValue & 0xFF0000) >> 16) / 255.0) \
green:(float)(((rgbValue & 0xFF00) >> 8) / 255.0)    \
blue:(float)((rgbValue & 0xFF) / 255.0)             \
alpha:1.0]

#define UIColorFromRGBA(rgbaValue) [UIColor                        \
colorWithRed:(float)(((rgbaValue & 0xFF000000) >> 16) / 255.0) \
green:(float)(((rgbaValue & 0xFF0000) >> 8) / 255.0)    \
blue:(float)((rgbaValue & 0xFF00) / 255.0)             \
alpha:(float)((rgbaValue & 0xFF) / 255.0)]

#define UIColorFromRGBAlpha(rgb, a) [UIColor            \
colorWithRed:(float)(((rgb >> 16) & 0xFF) / 255.0f) \
green:(((rgb >> 8) & 0xFF) / 255.0f)         \
blue:(((rgb)&0xFF) / 255.0f)                \
alpha:a]
#define RGBColor(R,G,B)  [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define onePX (1 / [[UIScreen mainScreen] scale])


#endif /* UIDefine_h */
