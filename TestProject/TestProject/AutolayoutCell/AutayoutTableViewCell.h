//
//  AutayoutTableViewCell.h
//  TestProject
//
//  Created by linqinbin on 16/3/5.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutayoutTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@end
