//
//  HMHeadLine.h
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHeadLine : NSObject
@property (nonatomic, copy) NSString *imgsrc;

//标题
@property (nonatomic, copy) NSString *title;

+(instancetype)headLineWithDic:(NSDictionary *)dict;

//加载头条新闻
+(void)loadHeadLineSuccess:(void(^)(NSArray *headLines))success faild:(void(^)(NSError *error))faild;
@end
