//
//  HMChannel.h
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMChannel : NSObject
/**
 *  新闻频道 名称
 */
@property (nonatomic, copy) NSString *tname;

/**
 *  tid值越小，频道越重要
 */
@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *URLString;

/**
 *  返回所有的新闻频道数据
 */
+ (NSArray *)channels;
-(instancetype)initWithDic:(NSDictionary *)dict;

+ (instancetype)channelWithDict:(NSDictionary *)dict;
@end
