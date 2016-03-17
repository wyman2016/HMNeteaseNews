//
//  HMChannelLabel.m
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import "HMChannelLabel.h"

@implementation HMChannelLabel

#define HMSelectedFont [UIFont systemFontOfSize:18]
#define HMNormalFont [UIFont systemFontOfSize:14]

+ (instancetype)labelWithTitle:(NSString *)title {
    // 创建 频道标签
    HMChannelLabel *channelLabel = [[self alloc] init];
    // 设置字体
    channelLabel.font = HMSelectedFont;
    // 设置内容
    channelLabel.text = title;
    // 自适应大小
    [channelLabel sizeToFit];
    
    channelLabel.textAlignment = NSTextAlignmentCenter;
    
    // 设置字体
    channelLabel.font = HMNormalFont;

    return channelLabel;
}

@end
