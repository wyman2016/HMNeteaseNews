//
//  HMLoopViewFlowLayout.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMLoopViewFlowLayout.h"

@implementation HMLoopViewFlowLayout


//使用该方法是,collectionView尺寸已经确定
-(void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumLineSpacing = 0;
    
    //设置方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;


}
@end
