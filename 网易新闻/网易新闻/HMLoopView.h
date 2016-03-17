//
//  HMLoopView.h
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    HMTitlePositionBlowImage,
    HMTitlePositionAboveImage,

}HMTitlePostion;
@interface HMLoopView : UIView
/**
 *  图片轮播器
 */
-(instancetype)initWithURLStrs:(NSArray <NSString *>*)URLStrs titles:(NSArray < NSString *> *)titles didSelected:(void(^)(NSInteger index))didSelected;

/**
 *  时间间隔
 */
@property (nonatomic, assign) NSInteger timerInterval;

//标题的位置
@property (nonatomic, assign) HMTitlePostion titlePostion;
@end
