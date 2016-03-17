//
//  HMNewsViewController.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//
#import "HMNews.h"
#import "HMNewsCell.h"
#import "HMNewsViewController.h"
@interface HMNewsViewController()
@property(nonatomic,strong)NSArray *news;
@end
@implementation HMNewsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
 
}
-(void)setURLString:(NSString *)URLString
{
    _URLString = [URLString copy];
  
    [HMNews loadNewsWithURLString:URLString Success:^(NSArray *news) {
        self.news = news;
        [self.tableView reloadData];
    } faild:^(NSError *error) {
        NSLog(@"error = %@",error);

    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMNews *news = self.news[indexPath.row];
    //获得cell重用
    NSString *ID = [HMNewsCell cellIDWithNew:news];
    HMNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    cell.news = news;
    return cell;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMNews *news = self.news[indexPath.row];
    return [HMNewsCell cellHeight:news];

}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}














@end
