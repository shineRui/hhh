//
//  ViewController.m
//  Qiu
//
//  Created by qianfeng on 15/12/7.
//  Copyright (c) 2015年 you are my sunshine. All rights reserved.
//
#define sc_w [UIScreen mainScreen].bounds.size.width
#define sc_h [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "qiuModel.h"
#import "TableViewCell.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIView *header;
    UIScrollView *HomescrollView;
    UIView *line;
    qiuModel *qiuM;
    CGFloat cell1Height;
    UIScrollView *acee;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    qiuM =[[qiuModel alloc]init];
    [qiuM loadMore:^(BOOL isSuccess, NSInteger status) {
        if (isSuccess) {
             UITableView *tab=(id)[HomescrollView viewWithTag:1000];
            [tab reloadData];
        }
    }];
   
//    qiuM.items
    
    
    for(int i = 0; i < 4; i++)
    {
    UISwipeGestureRecognizer *swipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
        swipe.direction = UISwipeGestureRecognizerDirectionRight<<i;
        [self.view addGestureRecognizer:swipe];
    }
 
    [self createQiuShiBtn];
    [self createTable];
}
-(void)swipeView:(UISwipeGestureRecognizer *)swipe
{
    UIView *header=(UIView *)[self.view viewWithTag:111];
    
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionDown)
    {
        NSLog(@"down");
//        header.center=CGPointMake(header.center.x, header.center.y+40);
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        
    }
    else if(swipe.direction == UISwipeGestureRecognizerDirectionUp)
    {
        NSLog(@"up");
        header.center=CGPointMake(header.center.x, header.center.y-40);
    }
}

-(void)createQiuShiBtn
{
    header =[[UIView alloc]initWithFrame:CGRectMake(0, 64, sc_w, 45)];
    header.backgroundColor=[UIColor yellowColor];
    header.tag=111;
    [self.view addSubview:header];
    NSArray *headerBtn=@[@"专享",@"视频",@"纯文",@"纯图",@"精华",@"最新"];
    for (int i = 0; i<6; i++)
    {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame =CGRectMake(sc_w/6*i, 0, sc_w/6, 40);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:headerBtn[i] forState:UIControlStateNormal];
        btn.tag=400+i;
        [header addSubview:btn];
        [btn addTarget:self action:@selector(qiuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    line=[[UIView alloc]initWithFrame:CGRectMake(0, 41, sc_w/6, 2)];
    line.backgroundColor =[UIColor greenColor];
    [header addSubview:line];
}
-(void)qiuBtnClick:(UIButton *)btn
{
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    CGFloat i=btn.frame.origin.x/(sc_w/6.0);
    HomescrollView.contentOffset=CGPointMake(sc_w*i, 0);
    CGRect li =line.frame;
    li.origin.x=i*sc_w/6.0;
    line.frame=li;
    
}
-(void)createTable
{
    HomescrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 115, sc_w, sc_h-155)];
    [self.view addSubview:HomescrollView];
    HomescrollView.contentSize=CGSizeMake(sc_w*6, sc_h-155);
    
    HomescrollView.alwaysBounceVertical=0;
    HomescrollView.delegate=self;
    
    HomescrollView.pagingEnabled = YES;
    HomescrollView.bounces=NO;
    HomescrollView.tag=250;
    
    for (int i =0; i<6; i++)
    {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(sc_w*i, 0, sc_w, sc_h-155)];
        //        table.backgroundColor = [UIColor redColor];
        
        table.dataSource = self;
        table.delegate = self;
        table.tag=1000+i;
        [HomescrollView addSubview:table];
    
    }
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag==250)
    {
        CGPoint currentPage=scrollView.contentOffset;
        float i =currentPage.x/sc_w;
        CGRect li =line.frame;
        li.origin.x=i*sc_w/6.0;
        line.frame=li;
        
        for (int i=0; i<6; i++)
        {
            UIButton *btnn =(id)[header viewWithTag:400+i];
            [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
        
        NSInteger j=currentPage.x/sc_w;
        UIButton *btn =(UIButton *)[header viewWithTag:400+j];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [qiuM.items count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cell1Height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (!cell1)
    {
        cell1=[[TableViewCell alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        cell1.model=qiuM.items[indexPath.row];
        cell1Height=[cell1 cellHeight];
        return cell1;
    }
    return [[UITableViewCell alloc]init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
