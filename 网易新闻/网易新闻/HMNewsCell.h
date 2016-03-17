//
//  HMNewsCell.h
//  网易新闻
//
//  Created by wyman on 16/3/14.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMNews.h"
@interface HMNewsCell : UITableViewCell
@property (nonatomic, strong) HMNews *news;

+(NSString *)cellIDWithNew:(HMNews *)news;

+(CGFloat)cellHeight:(HMNews *)news;
@end
