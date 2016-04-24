//
//  NSString+ChineseJudge.m
//  TestProject
//
//  Created by linqinbin on 16/4/24.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "NSString+ChineseJudge.h"

@implementation NSString (ChineseJudge)

- (BOOL)isChinese
{
    NSString* match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)includeChinese
{
    for (int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

@end
