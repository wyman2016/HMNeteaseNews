//
//  HMHeadLine.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMHeadLine.h"
#import "HMNetworkTool.h"
@implementation HMHeadLine
+(instancetype)headLineWithDic:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    return obj;

}
//找不到对应的


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

//加载头条新闻
+(void)loadHeadLineSuccess:(void(^)(NSArray *headLines))success faild:(void(^)(NSError *error))faild
{
    NSAssert(success!=nil, @"必须传入完成回调");
    [[HMNetworkTool sharedNetworkTool]GET:@"ad/headline/0-4.html" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task,  NSDictionary *responseObject) {
        //获取字典的第一个key
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        //获得数组
        NSArray *headLines = responseObject[rootKey];
        //创建可变的模型数组
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:headLines.count];
        //遍历数组
        [headLines enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMHeadLine *headLine = [HMHeadLine headLineWithDic:obj];
            //将模型添加到数组
            [arrayM addObject:headLine];
        }];
        success(arrayM.copy);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faild) {
            faild(error);
        }
    }];
    
}
@end
