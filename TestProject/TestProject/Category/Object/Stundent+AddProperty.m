//
//  Stundent+AddProperty.m
//  TestProject
//
//  Created by linqinbin on 16/4/24.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "Stundent+AddProperty.h"
#import <objc/runtime.h>

@implementation Stundent (AddProperty)

- (void)setUserInfo:(NSDictionary*)userInfo
{
    objc_setAssociatedObject(self, @"userInfo", userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)userInfo
{
    return objc_getAssociatedObject(self, @"userInfo");
}

@end
