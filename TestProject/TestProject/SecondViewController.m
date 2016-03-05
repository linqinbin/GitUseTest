//
//  SecondViewController.m
//  TestProject
//
//  Created by linqinbin on 16/3/2.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+AddCornerRadius.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(120, 10, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view qb_setCornerAnyPositionByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
