//
//  HMloopViewCell.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMloopViewCell.h"
#import <UIImageView+WebCache.h>
@interface HMloopViewCell()
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation HMloopViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.iconView = [[UIImageView alloc]init];
        [self addSubview:self.iconView];
    }
    return self;
}
-(void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:URLString]];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}
@end
