//
//  votesView.m
//  Qiu
//
//  Created by qianfeng on 15/12/8.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//

#import "votesView.h"

@implementation votesView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configUI];
    }
    return self;
}

-(void)configUI
{
    UIButton *smile =[UIButton buttonWithType:UIButtonTypeCustom];
    smile.frame=CGRectMake(20, 10, 30, 30);
    [smile setImage:[UIImage imageNamed:@"personal_smile"] forState:UIControlStateNormal];
    [smile setBackgroundImage:[UIImage imageNamed:@"pinfo_avatar_bg"] forState:UIControlStateNormal];
    [self addSubview:smile];
    [smile addTarget:self action:@selector(smileClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)smileClick:(UIButton *)btn
{
    static BOOL state=0;
    if (state==0) {
        [btn setImage:[UIImage imageNamed:@"personal_smile_night"] forState:UIControlStateNormal];
        state =1;
    }
    else
    {
         [btn setImage:[UIImage imageNamed:@"personal_smile"] forState:UIControlStateNormal];
        state=0;
    }
    
    
}
@end
