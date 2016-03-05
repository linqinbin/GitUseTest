//
//  AutolayoutCellViewController.m
//  TestProject
//
//  Created by linqinbin on 16/3/5.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "AutolayoutCellViewController.h"
#import "AutayoutTableViewCell.h"

@interface AutolayoutCellViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *nameArray;
    NSArray *detailArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation AutolayoutCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"AutayoutTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"AutayoutTableViewCell"];
    nameArray = @[@"1测试代码代码代码代码代码代码代测试代码代码代码代码代码测试代码代码代码代码代码码代码代码测试代码",@"2测试代码代测试代码代码代码代码代码测试代码代码代码代码代码码代码代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码代码测试代码",@"3测试代码代码代码代码代码代码代码代码代码测试代码",@"4测试代码代码代码代码代码代码代码代码代码测试代码",@"5测试代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码代码代码代码代码代码测试代码",];
    detailArray = @[@"1测试代码代码代码代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码代码测试代码",@"2测试代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码代码代码代码代码代码代码测试代码",@"3测码代码代码代码代码代码测试代码",@"4测试代码代码代码代码代码代码代码代码代码测试代码",@"5测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码测试代码代码代码代码代码代码代码代码代码测试代码"];
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AutayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutayoutTableViewCell" forIndexPath:indexPath];
    NSLog(@"%p",cell);
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(AutayoutTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int temp = arc4random_uniform(5)+1;
    NSLog(@"%d",temp);
    cell.headImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",temp]];
    cell.nameLabel.text = nameArray[temp-1];
    cell.detailLable.text = detailArray[temp-1];
                                
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
