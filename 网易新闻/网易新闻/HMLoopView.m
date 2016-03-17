//
//  HMLoopView.m
//  网易新闻
//
//  Created by wyman on 16/3/13.
//  Copyright © 2016年 wyman. All rights reserved.
//

#import "HMLoopView.h"
#import "HMHeadLine.h"
#import "HMloopViewCell.h"
#import "HMLoopViewFlowLayout.h"

@interface HMLoopView()<UICollectionViewDelegate,UICollectionViewDataSource>
//标题
@property (nonatomic, strong) UILabel *titleLabel;
//分页指示器
@property (nonatomic, strong) UIPageControl *pageControl;
//
@property (nonatomic, strong) UICollectionView *collectionView;
//图片数组
@property (nonatomic, strong) NSArray *URLStrs;
@property (nonatomic, strong) NSArray *titles;
//定时器
@property (nonatomic, strong) NSTimer *timer;

//选中回调Block
@property (nonatomic, copy) void (^didSelected)(NSInteger index);
@end
@implementation HMLoopView
-(instancetype)initWithURLStrs:(NSArray <NSString *>*)URLStrs titles:(NSArray < NSString *> *)titles didSelected:(void(^)(NSInteger index))didSelected
{
  //调用父类的init
    if (self = [super init]) {
        //记录属性
        self.URLStrs = URLStrs;
        self.titles = titles;
        self.didSelected = didSelected;
        //设置页数
        self.pageControl.numberOfPages = URLStrs.count;
        self.titleLabel.text = self.titles[0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.URLStrs.count > 1) {
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:URLStrs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
                
            }
        });
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

//创建子控件
-(void)setup
{
//创建collectionCview
    UICollectionView *collecionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[[HMLoopViewFlowLayout alloc]init]];
    
//注册 cell
    [collecionView registerClass:[HMloopViewCell class] forCellWithReuseIdentifier:@"QQ"];
    //设置代理和数据源
    collecionView.delegate = self;
    collecionView.dataSource = self;
    collecionView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    //添加到当前
    [self addSubview:collecionView];
    self.collectionView = collecionView;
    
    //创建标题
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor grayColor];
    [self addSubview:self.titleLabel];
    
    //分页指示器
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.hidesForSinglePage = YES;
    [self addSubview:self.pageControl];


}

/**
 *  设置frame
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat titleH = 30;
    CGRect frame = self.bounds;
    if (self.titlePostion == HMTitlePositionBlowImage) {
        frame.size.height = frame.size.height - titleH;
    }
    self.collectionView.frame = frame;
    //设置间距
    CGFloat marginX = 10;
    //设置pageController
    CGFloat pageY = self.bounds.size.height - titleH;
    CGFloat pageW = self.URLStrs.count*15;
    CGFloat pageX = self.bounds.size.width-pageW-marginX;
    CGFloat pageH = titleH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    //设置标题的farmae
    CGFloat titleW = self.bounds.size.width-pageW-marginX*3;
    self.titleLabel.frame = CGRectMake(marginX, pageY, titleW, titleH);


}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.URLStrs.count*((self.URLStrs.count == 1 )?1:100);

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMloopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QQ" forIndexPath:indexPath];
    cell.URLString = self.URLStrs[indexPath.item%self.URLStrs.count];
    
    return cell;
}






























@end
