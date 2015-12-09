//
//  qiuModel.h
//  Qiu
//
//  Created by qianfeng on 15/12/7.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface qiuModel : NSObject

@property (nonatomic, strong) NSNumber *err;
@property (nonatomic, strong) NSNumber *refresh;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *page;
@property(nonatomic,strong) NSArray *items;

@property(nonatomic,copy)loadData loadDataBlock;
-(void)loadMore:(loadData)block;


@end


@class userModel,votesModel;
@interface itemModel : NSObject

@property (nonatomic, strong) NSNumber *published_at;
@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, strong) NSNumber *created_at;

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, strong) NSNumber *allow_comment;
@property (nonatomic, strong) NSNumber *comments_count;

@property (nonatomic, strong) NSNumber *share_count;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSDictionary *image_size;
@property(nonatomic,strong)NSNumber *loop;

@property(nonatomic,strong)NSString *high_url;
@property(nonatomic,strong)NSString *low_url;
@property(nonatomic,strong)NSArray *pic_size;
@property(nonatomic,strong)NSString *pic_url;

@property(nonatomic,strong)userModel *user;
@property(nonatomic,strong)votesModel *votes;


@end

@interface userModel : NSObject

@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSNumber *avatar_updated_at;
@property (nonatomic, strong) NSNumber *created_at;
@property (nonatomic, copy) NSString *role;
@property (nonatomic, strong) NSNumber *Id;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *last_device;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, strong) NSNumber *last_visited_at;

@end

@interface votesModel : NSObject
@property (nonatomic, strong) NSNumber *up;
@property (nonatomic, strong) NSNumber *down;

@end


