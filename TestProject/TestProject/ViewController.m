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

@interface ViewController ()<UIViewControllerAnimatedTransitioning>

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSLog(@"Hello World!");
}
- (IBAction)autolayoutCellClick:(UIButton *)sender {
    AutolayoutCellViewController *secondVC = [[AutolayoutCellViewController alloc] init];
    [self presentViewController:secondVC animated:YES completion:nil];
}
- (IBAction)btnClick:(UIButton *)sender {
  SecondViewController *secondVC = [[SecondViewController alloc] init];
  [self presentViewController:secondVC animated:YES completion:nil];
    
    
}
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
