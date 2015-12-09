//
//  TableViewCell.m
//  Qiu
//
//  Created by qianfeng on 15/12/7.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//

#import "TableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "votesView.h"
@interface TableViewCell()
{
    AVAudioPlayer *auPlayer;
    MPMoviePlayerController *moviePlayer;
    MPMoviePlayerController *movieView;
    
    UIImageView *icon;
    UILabel *name;
    UILabel *content;
    UILabel *vote;
    UIImageView *img;
    votesView *vView;
}

@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
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
    icon =[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    icon.layer.cornerRadius=20;
    icon.layer.masksToBounds=YES;
    [self.contentView addSubview:icon];
    
    name =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(icon.frame)+10, icon.center.y-10, 200, 20)];
    
    [self.contentView addSubview:name];
    content =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(icon.frame)+5,sc_w-20 , 30)];
    content.font=[UIFont systemFontOfSize:15.0];
    content.numberOfLines=0;
    [self.contentView addSubview:content];
    vote =[[UILabel alloc]init];
    [self.contentView addSubview:vote];
   
}
-(void)setModel:(itemModel *)model
{
    _model =model;
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@",[[model.user.Id stringValue]substringToIndex:4],model.user.Id,model.user.icon]];
    [icon setImageWithURL:url];
    name.text=model.user.login;
    
   CGFloat height1 = [Tool heightForMaxByString:model.content maxWidth:sc_w-20 font:[UIFont systemFontOfSize:15.0]];
    
    CGRect frame =content.frame;
    frame.size.height=height1;
    content.frame=frame;
    content.text=model.content;
    if (model.pic_url) {
        
         img=(UIImageView *)[self.contentView viewWithTag:111];
        if (!img)
        {
            
            img=[[UIImageView alloc]init];
            img.tag=111;
            img.backgroundColor=[UIColor greenColor];
            [self.contentView addSubview:img];
        }

        if ([model.format isEqualToString:@"image"])
        {
            NSArray *size= model.image_size[@"m"];
            CGFloat bili=[size[0] integerValue]/[size[1] integerValue];
            
            img.frame=CGRectMake(10, CGRectGetMaxY(content.frame ), sc_w-20, sc_w*bili);
//           http://pic.qiushibaike.com/system/pictures/11414/114147471/medium/app114147471.jpg
            [img setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://pic.qiushibaike.com/system/pictures/%@/%@/medium/%@",[[model.user.Id stringValue]substringToIndex:4],model.user.Id,model.image]]];
            NSLog(@"---%@",[NSURL URLWithString:[NSString stringWithFormat:@"http://pic.qiushibaike.com/system/pictures/%@/%@/medium/%@",[[model.user.Id stringValue]substringToIndex:4],model.user.Id,model.image]]);
        }
        if ([model.format isEqualToString:@"video"]) {
           CGFloat bili=[model.pic_size[0] integerValue]/[model.pic_size[1] integerValue];
            img.frame=CGRectMake(10, CGRectGetMaxY(content.frame ), sc_w-20, sc_w*bili);
            
//            [img setImageWithURL:[NSURL URLWithString:model.pic_url]];
            moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:model.high_url]];
            moviePlayer.view.frame=CGRectMake(10, CGRectGetMaxY(content.frame ), sc_w-20, sc_w*bili);
            [self.contentView addSubview:moviePlayer.view];
            [moviePlayer prepareToPlay];
            [moviePlayer play];
        }
        
    }
    
//    vote.frame=CGRectMake(10, CGRectGetMaxY(self.contentView.frame)-20, sc_w-20, 20);
//    NSLog(@"%@",model.votes);
//    vote.text=[NSString stringWithFormat:@"----"];
    vView =[[votesView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(content.frame), 200, 50)];
    [self.contentView addSubview:vView];
    
}
-(CGFloat)cellHeight
{
    if (img) {
       return CGRectGetMaxY(img.frame)+50;
    }
    return CGRectGetMaxY(content.frame)+50;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
