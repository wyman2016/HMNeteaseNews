//
//  HMNetworkTool.h
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface HMNetworkTool :AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;
@end
