//
//  HMNews.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMNews.h"
#import "HMNetworkTool.h"
@implementation HMNews

+(instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
+(void)loadNewsWithURLString:(NSString *)URLString Success:(void (^)(NSArray *news))success faild:(void(^)(NSError *error))failed
{
[[HMNetworkTool sharedNetworkTool]GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    
} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
    NSString *rootkey = responseObject.keyEnumerator.nextObject;
    NSArray *headLine = responseObject[rootkey];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:headLine.count];
    //遍历数组
    [headLine enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HMNews *news = [HMNews newsWithDict:obj];
        [arrayM addObject:news];
    }];
    //完成回调
    success(arrayM.copy);
    
    
    
    
    
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failed) {
        failed(error);
    }
}];


}

@end
