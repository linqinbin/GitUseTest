//
//  NSString+ChineseJudge.h
//  TestProject
//
//  Created by linqinbin on 16/4/24.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChineseJudge)

/**
 *  判断是否纯汉字
 */
- (BOOL)isChinese;

/**
 *  判断是否含有汉字
 */
- (BOOL)includeChinese;

@end
