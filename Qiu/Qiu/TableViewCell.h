//
//  TableViewCell.h
//  Qiu
//
//  Created by qianfeng on 15/12/7.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "qiuModel.h"
@interface TableViewCell : UITableViewCell
@property(nonatomic,strong)itemModel *model;


-(CGFloat)cellHeight;
@end
