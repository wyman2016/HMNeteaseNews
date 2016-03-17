//
//  HMHeadLineViewController.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMHeadLineViewController.h"
#import "HMHeadLine.h"
#import "HMLoopView.h"
@implementation HMHeadLineViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    //首页广告
    [HMHeadLine loadHeadLineSuccess:^(NSArray *headLines) {
        NSLog(@"headline = %@",headLines);
        //创建图片轮播器
        HMLoopView *loopView = [[HMLoopView alloc]initWithURLStrs:[headLines valueForKeyPath:@"imgsrc"] titles:[headLines valueForKeyPath:@"title"] didSelected:^(NSInteger index) {
            NSLog(@"点击了第好多");
        }];
        loopView.frame = self.view.bounds;
        [self.view addSubview:loopView];
        
    } faild:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}
@end
