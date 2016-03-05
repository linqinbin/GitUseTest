//
//  NSTimer+XXBlocksSupport.h
//  TestProject
//
//  Created by linqinbin on 16/3/5.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XXBlocksSupport)

//- (void)start {
//    __weak XXClass *weakSelf = self;
//    timer = [NSTimer xx_scheduledTimerWithTimeInterval:.5
//                                                 block:^{
//                                                     XXClass *strongSelf = weakSelf;
//                                                     [strongSelf doSomething];
//                                                 }
//                                               repeats:YES];
//}
/**
 *  解决NSTimer循环引用
 *
 *  @param interval 循环时间
 *  @param block    执行代码
 *  @param repeats  是否重复
 *
 *  @return 返回NSTimer对象
 */
+ (NSTimer *)xx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

@end
