//
//  ViewController.m
//  TestProject
//
//  Created by linqb on 16/3/1.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/p/257a28846956"]]];
    

    NSLog(@"Hello World!");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
