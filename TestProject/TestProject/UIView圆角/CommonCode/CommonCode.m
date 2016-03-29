//
//  CommonCode.m
//  TestProject
//
//  Created by linqb on 16/3/29.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "CommonCode.h"

@implementation CommonCode

+(void)test{

//    一行代码解决改变展位图文本颜色代码
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    // 模糊效果
    //    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //    UIVisualEffectView *test = [[UIVisualEffectView alloc] initWithEffect:effect];
    //    test.frame = self.view.bounds;
    //    test.alpha = 0.5;
    //    [self.view addSubview:test];

//    添加每个cell出现时的3D动画
    /*
    -(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        
        // 动画1
        //    CATransform3D rotation;//3D旋转
        //    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
        //    //逆时针旋转
        //    rotation.m34 = 1.0/ -600;
        //
        //    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        //    cell.layer.shadowOffset = CGSizeMake(10, 10);
        //    cell.alpha = 0;
        //
        //    cell.layer.transform = rotation;
        //
        //    [UIView beginAnimations:@"rotation" context:NULL];
        //    //旋转时间
        //    [UIView setAnimationDuration:0.8];
        //    cell.layer.transform = CATransform3DIdentity;
        //    cell.alpha = 1;
        //    cell.layer.shadowOffset = CGSizeMake(0, 0);
        //    [UIView commitAnimations];

        // 动画2
        cell.alpha = 0.5;
        
        CGAffineTransform transformScale = CGAffineTransformMakeScale(0.3,0.8);
        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);
        
        cell.transform = CGAffineTransformConcat(transformScale, transformTranslate);
        
        [tableView bringSubviewToFront:cell];
        [UIView animateWithDuration:.4f
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             
                             cell.alpha = 1;
                             //清空 transform
                             cell.transform = CGAffineTransformIdentity;
                             
                         } completion:nil];
        
        
        
        
        
        // 动画3
        /*
         // 从锚点位置出发，逆时针绕 Y 和 Z 坐标轴旋转90度
         CATransform3D transform3D = CATransform3DMakeRotation(M_PI_2, 0.0, 1.0, 1.0);
         
         // 定义 cell 的初始状态
         cell.alpha = 0.0;
         cell.layer.transform = transform3D;
         cell.layer.anchorPoint = CGPointMake(0.0, 0.5); // 设置锚点位置；默认为中心点(0.5, 0.5)
         
         // 定义 cell 的最终状态，执行动画效果
         // 方式一：普通操作设置动画
         [UIView beginAnimations:@"transform" context:NULL];
         [UIView setAnimationDuration:0.5];
         cell.alpha = 1.0;
         cell.layer.transform = CATransform3DIdentity;
         CGRect rect = cell.frame;
         rect.origin.x = 0.0;
         cell.frame = rect;
         [UIView commitAnimations];
         
         // 方式二：代码块设置动画
         //        [UIView animateWithDuration:0.5 animations:^{
         //                cell.alpha = 1.0;
         //                 cell.layer.transform = CATransform3DIdentity;
         //                CGRect rect = cell.frame;
         //                 rect.origin.x = 0.0;
         //            cell.frame = rect;
         //             }];
         
         */
    

//    通过2D仿射函数实现小的动画效果(变大缩小) --可用于自定义pageControl中.
//    [UIView animateWithDuration:0.3 animations:^{
//        imageView.transform = CGAffineTransformMakeScale(2, 2);
//    } completion:^(BOOL finished) {
//        imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
//    }];
    
//    6.取消图片的渲染
//    [button setImage:[[UIImage imageNamed:@"1.jpg" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal] ;
    
//    根据UILabel里的内容自适应高度
//    NSString *contentString = [dic objectForKey:@"content"] ; //从字典中提取字符串
//    CGRect rect = [contentString boundingRectWithSize:CGSizeMake(tableView.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:15]} context:nil] ;
    // 内容的自适应高度方法
//    *  @param CGSize 规定文本显示的最大范围
//    @param options 按照何种设置来计算范围
//    @param attributes 文本内容的一些属性,例如字体大小,字体类型等  (字体不一样,高度也不一样)
//    @parma context 上下文 可以规定一些其他的设置 但是一般都是nil
//    */
    // 枚举值中的 " | "  意思是要满足所有的枚举值设置.
}

//.UITextField的字数限制
//// viewDidLoad中
//[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
//                                            name:@"UITextFieldTextDidChangeNotification" object:myTextField];
//-(void)textFiledEditChanged:(NSNotification *)obj
//{
//    UITextField *textField = (UITextField *)obj.object;
//    NSString *toBeString = textField.text;
//    
//    //获取高亮部分
//    UITextRange *selectedRange = [textField markedTextRange];
//    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
//    
//    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//    if (!position)
//    {
//        if (toBeString.length > MAX_STARWORDS_LENGTH)
//        {
//            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:MAX_STARWORDS_LENGTH];
//            if (rangeIndex.length == 1)
//            {
//                textField.text = [toBeString substringToIndex:MAX_STARWORDS_LENGTH];
//            }
//            else
//            {
//                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, MAX_STARWORDS_LENGTH)];
//                textField.text = [toBeString substringWithRange:rangeRange];
//            }
//        }
//    }
//}


@end
