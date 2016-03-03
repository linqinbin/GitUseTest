//
//  ViewController.m
//  TestProject
//
//  Created by linqb on 16/3/1.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UIViewControllerAnimatedTransitioning>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Hello World!");
}
- (IBAction)btnClick:(UIButton *)sender {
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [self presentViewController:secondVC animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
