//
//  HMHomeViewController.m
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMChannel.h"
#import "HMChannelCell.h"
#import "HMChannelLabel.h"
@interface HMHomeViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

/**
 *  布局参数
 */
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
/**
 *  新闻频道数组
 */
@property (nonatomic, strong) NSArray *channels;
@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.collectionView registerClass:[HMChannelCell class] forCellWithReuseIdentifier:@"channelCell"];
//    NSLog(@"%@",[HMChannel channels]);
    
    // 添加频道标签
    [self setupChannel];
}

// 在 iOS 7.0 之后，如果视图控制器中有 UINavigationController + UIScrollView的组合，会默认调整 UIScrollView 的边距，从而达到穿透 Nav 的效果
/**
 *  添加频道标签
 */
- (void)setupChannel {
    // 设置不要自动调整UIScrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 获得channelView的高度
    CGFloat channelH = self.channelView.frame.size.height;
    // 频道标签之间的间隙
    CGFloat marginX = 8;
    CGFloat lableX = marginX;
    for (HMChannel *channel in self.channels) {
        // 创建 频道标签
        HMChannelLabel *channelLabel = [HMChannelLabel labelWithTitle:channel.tname];
        // 设置x和y值
        channelLabel.frame = CGRectMake(lableX, 0, channelLabel.frame.size.width, channelH);
//        channelLabel.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        // 将频道标签添加channelView上
        [self.channelView addSubview:channelLabel];
        
        lableX += channelLabel.frame.size.width;
    }
    
    // 设置滚动范围
    self.channelView.contentSize = CGSizeMake(lableX + marginX, 0);
    self.channelView.showsHorizontalScrollIndicator = NO;
}

/**
 *  当控制的view布局好之后调用
 */
- (void)viewDidLayoutSubviews {
    // 一定要记得调用父类
    [super viewDidLayoutSubviews];
    // 设置布局属性
    [self setupFlowLayout];
}


/**
 *  设置布局属性
 */
- (void)setupFlowLayout {
    // 设置item的尺寸
    self.flowLayout.itemSize = self.collectionView.bounds.size;
    NSLog(@"%@",NSStringFromCGSize(self.collectionView.bounds.size));
    // 设置item之间的间隙
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    // 设置方向
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置分页效果
    self.collectionView.pagingEnabled = YES;
    // 设置隐藏水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 禁止弹簧效果
    self.collectionView.bounces = NO;
}

#pragma mark - collectionView 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMChannelCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"channelCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    HMChannel *channel = self.channels[indexPath.item];
    cell.URLString = channel.URLString;
    return cell;
}


- (NSArray *)channels {
    if (_channels == nil) {
        _channels = [HMChannel channels];
    }
    return _channels;
}
@end
