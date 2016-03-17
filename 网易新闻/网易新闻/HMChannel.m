//
//  HMChannel.m
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import "HMChannel.h"

@implementation HMChannel
//+ (instancetype)channelWithDict:(NSDictionary *)dict {
//    id obj = [[self alloc] init];
//
//    [obj setValuesForKeysWithDictionary:dict];
//    
//    
//
//    return obj;
//}
+ (instancetype)channelWithDict:(NSDictionary *)dict {
    return [[HMChannel alloc]initWithDic:dict];
    
}

-(instancetype)initWithDic:(NSDictionary *)dict

{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    _URLString = [NSString stringWithFormat:@"article/headline/%@/0-20.html",self.tid];

    return self;
}
//-(void)setTid:(NSString *)tid
//{
//    _tid = [tid copy];
//    _URLString = [NSString stringWithFormat:@"article/headline/%@/0-20.html",tid];
//    
//}
//-(void)setTname:(NSString *)tname
//{
//    _tname = [tname copy];
//   
//
//
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

/**
 *  返回所有的新闻频道数据
 */
+ (NSArray *)channels {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil]];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    // 获得第一个key
    NSString *rootKey = dict.keyEnumerator.nextObject;
    // 获得数组
    NSArray *array = dict[rootKey];
    
    NSMutableArray *channels = [NSMutableArray array];
    // 遍历数组
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [channels addObject:[HMChannel channelWithDict:obj]];
//        [channels addObject:[HMChannel alloc]initWithDic:obj];
    }];
    
    // 排序
    return [channels sortedArrayUsingComparator:^NSComparisonResult(HMChannel  *obj1,   HMChannel  *obj2) {
//        NSOrderedAscending = -1L, 升序
//        NSOrderedSame, 相等
//        NSOrderedDescending 降序
        return [obj1.tid compare:obj2.tid];
        
    }];
}
@end
