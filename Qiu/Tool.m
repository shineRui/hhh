//
//  Tool.m
//  day17-06-qq聊天界面
//
//  Created by Aaron on 15/10/27.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "Tool.h"

@implementation Tool
+(UITextField *)createTextFieldByFrame:(CGRect)frame andBoardStyle:(UITextBorderStyle)style andPlaceHolder:(NSString *)placeHolder
{
    UITextField *text = [[UITextField alloc] initWithFrame:frame];
    text.borderStyle = style;
    text.placeholder = placeHolder;
    return text;
}

+(UIButton *)createButtonWithType:(UIButtonType)type withFrame:(CGRect)frame withTitle:(NSString *)title withTextColor:(UIColor *)color withTarget:(id)target withAction:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UIImage *)imageRs:(UIImage *)img
{
    CGSize size = img.size;
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(size.height/2, size.width/2, size.height/2, size.width/2)];
}

+(CGFloat)heightForMaxByString:(NSString *)text maxWidth:(CGFloat)maxWidth font:(UIFont *)font
{
    //参数一: 范围,固定宽,高度设置很大,则可以求动态变化之后需要的高度
    //参数三: 属性
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(maxWidth, 10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return bounds.size.height;
}

@end
