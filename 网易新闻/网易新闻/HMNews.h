//
//  HMNews.h
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMNews : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, strong) NSArray *imgextra;
//是否大图
@property (nonatomic, assign) BOOL imgType;
+(instancetype)newsWithDict:(NSDictionary *)dict;

+(void)loadNewsWithURLString:(NSString *)URLString Success:(void (^)(NSArray *news))success faild:(void(^)(NSError *error))failed;
@end
