//
//  GCDCode.m
//  TestProject
//
//  Created by linqinbin on 16/4/1.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "GCDCode.h"

@implementation GCDCode

- (void)gcdTest
{
    //创建串行队列
    dispatch_queue_t serialDispatchQueue=dispatch_queue_create("com.test.queue", DISPATCH_QUEUE_SERIAL);
    //在异步线程执行这个队列
    dispatch_async(serialDispatchQueue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(serialDispatchQueue, ^{
        sleep(2);
        NSLog(@"2");
    });
    
    dispatch_async(serialDispatchQueue, ^{
        sleep(1);
        NSLog(@"3");  
    });//线程中做了串行输出，相互彼此依赖，串行执行
    //创建并发队列
    dispatch_queue_t concurrentDispatchQueue=dispatch_queue_create("com.test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentDispatchQueue, ^{
        NSLog(@"1");
    });
    dispatch_async(concurrentDispatchQueue, ^{
        sleep(2);
        NSLog(@"2");
    });
    dispatch_async(concurrentDispatchQueue, ^{
        sleep(1);
        NSLog(@"3");
    });//不同编号的线程中进行，而且相互不依赖，不阻塞
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"异步线程");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"异步主线程");
        });
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSLog(@"4");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"3");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"1");
    });
    
    NSLog(@"小破孩-波波1");
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"小破孩-波波2");
    });
    
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_async(group, queue, ^{NSLog(@"0");});
    dispatch_group_async(group, queue, ^{NSLog(@"1");});
    dispatch_group_async(group, queue, ^{NSLog(@"2");});
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{NSLog(@"down");});
    /*
     
    dispatch_queue_t concurrentDispatchQueue=dispatch_queue_create("com.test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"0");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"1");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"2");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"3");});
    dispatch_barrier_async(concurrentDispatchQueue, ^{sleep(1); NSLog(@"4");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"5");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"6");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"7");});
    dispatch_async(concurrentDispatchQueue, ^{NSLog(@"8");});
     
     */
    //dispatch_apply发现这个方法虽然会开启多个线程来遍历这个数组，但是在遍历完成之前会阻塞主线
    NSArray *array=[[NSArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6", nil];
    dispatch_queue_t queue1=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply([array count], queue1, ^(size_t index) {
        NSLog(@"%zu=%@",index,[array objectAtIndex:index]);
    });
    NSLog(@"阻塞");
    /*
//    dispatch_suspend & dispatch_resume队列挂起和恢复
    dispatch_queue_t concurrentDispatchQueue=dispatch_queue_create("com.test.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentDispatchQueue, ^{serialDispatchQueue
        for (int i=0; i<100; i++)
        {
            NSLog(@"%i",i);
            if (i==50)
            {
                NSLog(@"-----------------------------------");
                dispatch_suspend(concurrentDispatchQueue);
                sleep(3);
                dispatch_async(dispatch_get_main_queue(), ^{
                    dispatch_resume(concurrentDispatchQueue);
                });
            }
        }
    });
     */
}










@end
