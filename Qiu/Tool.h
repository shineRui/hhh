//
//  Tool.h
//  day17-06-qq聊天界面
//
//  Created by Aaron on 15/10/27.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
+(UITextField *)createTextFieldByFrame:(CGRect)frame andBoardStyle:(UITextBorderStyle)style andPlaceHolder:(NSString *)placeHolder;

+(UIButton *)createButtonWithType:(UIButtonType)type withFrame:(CGRect)frame withTitle:(NSString *)title withTextColor:(UIColor *)color withTarget:(id)target withAction:(SEL)action;

+(UIImage *)imageRs:(UIImage *)img;

+(CGFloat)heightForMaxByString:(NSString *)text maxWidth:(CGFloat)maxWidth font:(UIFont *)font;
@end
