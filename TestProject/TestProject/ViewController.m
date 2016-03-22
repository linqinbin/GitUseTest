//
//  ViewController.m
//  TestProject
//
//  Created by linqb on 16/3/1.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AutolayoutCellViewController.h"
#import "QRReaderViewController.h"
#import "JavaScriptCoreViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self NSInvocationTest];
    
    
    
}


- (IBAction)qrBtnClick:(UIButton *)sender {
    QRReaderViewController *QRVC = [[QRReaderViewController alloc]init];
    
    [self.navigationController pushViewController:QRVC animated:YES];
}

- (IBAction)jsTestClick:(id)sender {
    JavaScriptCoreViewController *JSVC = [[JavaScriptCoreViewController alloc]init];
    
    [self.navigationController pushViewController:JSVC animated:YES];
}


- (IBAction)autolayoutCellClick:(UIButton *)sender {
    AutolayoutCellViewController *secondVC = [[AutolayoutCellViewController alloc] init];
    [self presentViewController:secondVC animated:YES completion:nil];
}
- (IBAction)btnClick:(UIButton *)sender {
  SecondViewController *secondVC = [[SecondViewController alloc] init];
  [self presentViewController:secondVC animated:YES completion:nil];

}

#pragma mark NSInvocation的简单使用 例子：只知道方法名字符串，来执行方法
- (void)NSInvocationTest{
    //方法名字符串
    NSString *methodNameStr = @"test:withArg2:andArg3:";
    SEL selector = NSSelectorFromString(methodNameStr);
    
//    NSMethodSignature有两个常用的只读属性a. numberOfArguments:方法参数的个数b. methodReturnLength:方法返回值类型的长度，大于0表示有返回值
    //创建签名和NSInvocation对象，并赋值
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
 
//    4.给要执行的方法设置参数使用setArgument:atIndex:方法给要执行的方法设置参数，注意下标从2开始，因为0、1已经被target与selector占用
    NSString *arg1 = @"a";
    NSString *arg2 = @"b";
    NSString *arg3 = @"c";
    [invocation setArgument:&arg1 atIndex:2];
    [invocation setArgument:&arg2 atIndex:3];
    [invocation setArgument:&arg3 atIndex:4];
    //执行方法
    [invocation invoke];
    
    //通过方法签名的methodReturnLength判断是否有返回值
    if (signature.methodReturnLength > 0) {
        id result = nil;
        [invocation getReturnValue:&result];
        NSLog(@"%@",result);
    }
}
//要执行的方法
- (NSString *)test:(NSString *)arg1 withArg2:(NSString *)arg2 andArg3:(NSString *)arg3 {
    NSLog(@"%@---%@---%@", arg1, arg2, arg3);
    return @"haha";
}
#pragma mark GCD
- (void)GCD_Common{
    // 一次性执行：
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // code to be executed once
    });
    
    // 延迟2秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // code to be executed on the main queue after delay
    });
    
    
    // 合并汇总结果
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程一
    });
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程二
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
        // 汇总结果
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
