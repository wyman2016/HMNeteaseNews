//
//  HMNewsCell.m
//  网易新闻
//
//  Created by wyman on 16/3/14.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMNewsCell.h"
#import "HMNews.h"
#import <UIImageView+WebCache.h>
@interface HMNewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestLe;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextras;
@end

@implementation HMNewsCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setNews:(HMNews *)news
{
    _news = news;
    self.titleView.text = news.title;
    self.digestLe.text = news.digest;
    self.digestLe.numberOfLines=0;
    self.digestLe.lineBreakMode = UILineBreakModeWordWrap;

    self.replyCount.text = [NSString stringWithFormat:@"%zd跟帖",[news.replyCount intValue]];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc]];
     [news.imgextra enumerateObjectsUsingBlock:^(NSDictionary *imageDict, NSUInteger idx, BOOL * _Nonnull stop) {
         UIImageView *imageView = self.imgextras[idx];
         NSString *imgsrc = imageDict[@"imgsrc"];
         [imageView sd_setImageWithURL:[NSURL URLWithString:imgsrc]];
     }];
}
+(NSString *)cellIDWithNew:(HMNews *)news
{
NSString *ID =@"news";
    if (news.imgextra) {
        ID = @"threeImage";
    }else if(news.imgType)
    {
    ID = @"bigImageCell";
    }
    return ID;

}
+(CGFloat)cellHeight:(HMNews *)news
{
    CGFloat height = 80;
    if (news.imgextra) {
        height = 120;
    }else if(news.imgType)
    {
        height = 170;
    }
    return height;


}

@end
