//
//  CommonDefine.h
//  TestProject
//
//  Created by linqb on 16/4/28.
//  Copyright © 2016年 linqb. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h


#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define TW_SYSTEM_VERSION_LESS_THAN(v)   ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define TW_SYSTEM_VERSION_HIGGER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#endif /* CommonDefine_h */

/*
 
 Podfile
 platform :ios, '7.0'
 inhibit_all_warnings!
 pod 'AFNetworking'
 pod 'MBProgressHUD'
 pod 'NJKWebViewProgress'
 pod 'NSDate-Extensions'
 pod 'OHAttributedLabel'
 pod 'OpenUDID'
 pod 'SDWebImage'
 pod 'RTLabel'
 pod 'MJRefresh'
 pod 'TSMessages'
 pod 'ViewUtils'
 pod 'Reachability'
 pod 'FMDB'
 pod 'PBWebViewController'
 pod 'Mantle', '~> 1.5.4'
 pod 'HexColors', '~>2.2.1'
 pod 'Masonry'
 pod 'MCColoredPageControl', '~> 1.0.1'
 pod 'DZNEmptyDataSet'			    # 设置列表为空
 pod 'XXNibBridge','~> 2.1'                  # 实现xib重用
 pod 'TPKeyboardAvoiding'                    # 处理 scrollview, tableview 键盘盖住 textFiled, textView
 pod 'WYPopoverController', '~> 0.2.2'       # 在当前ViewController弹出新的ViewController
 pod 'SZTextView'                            # 带 placeHolderText 的 UITextView
 pod 'UITableView+FDTemplateLayoutCell'      # UITableViewCell 自动高度计算，缓存
 pod 'ReactiveCocoa'
 pod 'FDFullscreenPopGesture', '1.1'
 pod 'PNChart'
 pod 'JTMaterialTransition', '~> 1.0'
 pod 'ZXingObjC', '~> 3.0'
 pod 'TYAlertController', '~> 1.1.3'
 pod 'YYText'
 pod 'DateTools'
 
 */








