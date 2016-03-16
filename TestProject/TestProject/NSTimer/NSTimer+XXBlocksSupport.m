//
//  NSTimer+XXBlocksSupport.m
//  TestProject
//
//  Created by linqinbin on 16/3/5.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "NSTimer+XXBlocksSupport.h"

@implementation NSTimer (XXBlocksSupport)


+ (NSTimer *)xx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(xx_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)xx_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if(block) {
        block();
    }
}

@end
