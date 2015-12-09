//
//  qiuModel.m
//  Qiu
//
//  Created by qianfeng on 15/12/7.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//

#import "qiuModel.h"
#import "MJExtension.h"

@implementation qiuModel

-(void)loadMore:(loadData)block
{
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:QIUSHIBAIKE parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.responseString
              );
        qiuModel *model =[qiuModel objectWithJSONData:operation.responseData];
        
        self.items=model.items;
        
        
        block(YES,1);
                
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSInteger code=error.code;
        block(NO,code);
    }];
    
}

+ (NSDictionary *)objectClassInArray
{
    return @{@"items":[itemModel class]};
}

@end

@implementation itemModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
   
    return @{@"Id":@"id"};
}

@end

@implementation userModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    
    return @{@"Id":@"id"};
}

@end

@implementation votesModel


@end















