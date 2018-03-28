//
//  ViewController.m
//  MarqueeViewDemo
//
//  Created by Tiny on 2018/3/28.
//  Copyright © 2018年 hxq. All rights reserved.
//

#import "ViewController.h"
#import "HXQMarqueeModel.h"
#import "HXQMarqueeView.h"
#import "UIView+Extionsiton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *path =  [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
    NSArray * arr = [[NSArray alloc] initWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *modelList = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        HXQMarqueeModel *model = [[HXQMarqueeModel alloc] initWithDictionary:dict];
        [modelList addObject:model];
    }
    
    UIImageView *todayImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 44, 44)];
    todayImgView.image = [UIImage imageNamed:@"xingzhi_jinrishouyi"];
    [self.view addSubview:todayImgView];
    
    HXQMarqueeView *marqueeView = [[HXQMarqueeView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(todayImgView.frame) + 5, 100, self.view.bounds.size.width - todayImgView.width - 5 - 20, 44)];
    marqueeView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:marqueeView];
    [marqueeView setItems:modelList];
    [marqueeView startAnimation];
    [marqueeView addMarueeViewItemClickBlock:^(HXQMarqueeModel *model) {
        NSLog(@"%@",model.title);
    }];
    
    
    UIImageView *todayImgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 44, 44)];
    todayImgView1.image = [UIImage imageNamed:@"xingzhi_jinrishouyi"];
    [self.view addSubview:todayImgView1];
    HXQMarqueeView *marqueeView1 = [[HXQMarqueeView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(todayImgView.frame) + 5, 300, self.view.bounds.size.width - todayImgView.width - 5 - 20, 44)];
    marqueeView1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:marqueeView1];
    [marqueeView1 setItems:modelList];
    [marqueeView1 addMarueeViewItemClickBlock:^(HXQMarqueeModel *model) {
        NSLog(@"%@",model.title);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [marqueeView1 startAnimation];
    });

}

@end
